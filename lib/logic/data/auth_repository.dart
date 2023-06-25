import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<UserCredential?> signIn();
  Future<void> signOut();
}

class FirebaseAuthenticationRepository extends AuthenticationRepository {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserCredential? userCredential;

  @override
  Future<UserCredential?> signIn() async {
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
          return userCredential;
        } else {
          print("Failed to sign in with credential");
          return null;
        }
      } else {
        print("Failed to sign in with Google");
        return null;
      }
    } on Exception catch (e) {
      print('Error ${e}');
    }
    return null;
  }

  @override
  Future<void> signOut() async {
    await googleSignIn.signOut();
    await firebaseAuth.signOut();
  }
}
