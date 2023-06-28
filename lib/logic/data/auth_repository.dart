import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tuple/tuple.dart';

abstract class AuthenticationRepository {
  Future<Tuple2<UserCredential?, bool>> signInWithGoogle();
  Future<void> signOut();
  Future<Tuple2<UserCredential?, bool>> signInWithEmail(
      String email, String password);
  Future<String> registerWithEmail(String email, String password);
}

class FirebaseAuthenticationRepository extends AuthenticationRepository {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserCredential? userCredential;

  @override
  Future<Tuple2<UserCredential?, bool>> signInWithGoogle() async {
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
          return const Tuple2(null, false);
        }
      } else {
        print("Failed to sign in with Google");
        return const Tuple2(null, false);
      }
    } on FirebaseAuthException catch (e) {
      print('Error ${e}');
    }
    return const Tuple2(null, false);
  }

  @override
  Future<Tuple2<UserCredential?, bool>> signInWithEmail(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return Tuple2(userCredential, true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('User dengan email tersebut tidak ditemukan.');
      } else if (e.code == 'wrong-password') {
        print('Password yang dimasukkan salah.');
      } else {
        print('Terjadi kesalahan: ${e.message}');
      }
    }
    return const Tuple2(null, false);
  }

  @override
  Future<String> registerWithEmail(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      return 'Registrasi berhasil! User ID: ${user?.uid}';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'Password yang Anda masukkan terlalu lemah.';
      } else if (e.code == 'email-already-in-use') {
        return 'Email sudah digunakan oleh akun lain.';
      } else {
        return 'Terjadi kesalahan: ${e.message}';
      }
    }
  }

  @override
  Future<void> signOut() async {
    await googleSignIn.signOut();
    await firebaseAuth.signOut();
  }
}
