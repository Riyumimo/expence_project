part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.signInWithGoogle() = _SignInWithGoogleEvent;
  const factory AuthenticationEvent.getSignIn(FirebaseAuth firebaseAuth) =
      _GetSignInEvent;
  const factory AuthenticationEvent.signOut() = _SignOutEvent;
  const factory AuthenticationEvent.signInWithEmail(
      String email, String password) = _SignInWithEmailEvent;
  const factory AuthenticationEvent.registerWithEmail(
      String email, String password, String fullName) = _RegisterWithEmailEvent;
}
