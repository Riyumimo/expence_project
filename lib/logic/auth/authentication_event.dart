part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.signIn() = _SignInEvent;
  const factory AuthenticationEvent.getSignIn(FirebaseAuth firebaseAuth) =
      _GetSignInEvent;
  const factory AuthenticationEvent.signOut() = _SignOutEvent;
}
