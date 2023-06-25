import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tuple/tuple.dart';

abstract class AuthenticationRepository {
  Future<Tuple2<UserCredential?, bool>> signIn();
  Future<void> signOut();
}

class FirebaseAuthenticationRepository extends AuthenticationRepository {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserCredential? userCredential;

  @override
  Future<Tuple2<UserCredential?, bool>> signIn() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        print(googleUser.email);

        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

        final UserCredential userCredential =
            await firebaseAuth.signInWithCredential(credential);

        if (userCredential.user != null) {
          print(userCredential.user?.email);
          this.userCredential = userCredential;
          return Tuple2(userCredential, true);
        } else {
          print("Failed to sign in with credential");
          return Tuple2(null, false);
        }
      } else {
        print("Failed to sign in with Google");
        return Tuple2(null, false);
      }
    } on Exception catch (e) {
      print('Error ${e}');
    }
    return Tuple2(null, false);
  }

  @override
  Future<void> signOut() async {
    await googleSignIn.signOut();
    await firebaseAuth.signOut();
  }
}
