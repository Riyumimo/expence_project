part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _InitialState;
  const factory UserState.loaded(UserModel userModel) = _LoadedState;
  const factory UserState.error(String message) = _ErrorState;
}
