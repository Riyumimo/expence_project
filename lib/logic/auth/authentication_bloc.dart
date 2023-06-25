import 'package:bloc/bloc.dart';
import 'package:expence_project/logic/data/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository repo;
  AuthenticationBloc(this.repo) : super(const _Initial()) {
    // Initial
    on<_GetSignInEvent>((event, emit) async {
      // Obtain shared preferences.
      print('get started');
      if (event.firebaseAuth.currentUser != null) {
        print(event.firebaseAuth.currentUser);

        emit(const _Authenticated());
      } else {
        emit(_Initial());
      }
    });

    //Sign In
    on<_SignInEvent>((event, emit) async {
      final result = await repo.signIn();
      emit(const _Loaded(isLoading: true));
      await Future.delayed(
        const Duration(seconds: 2),
      );
      await SharedPreferences.getInstance().then(
        (value) {
          value.setString('auth', result!.user!.uid);
        },
      );
      emit(const _Loaded(isLoading: false));
      if (result != null) {
        print('login succsess');
        emit(const _Authenticated());
      }
    });

    //Sign Out
    on<_SignOutEvent>((event, emit) async {
      if (state is _Authenticated) {
        try {
          await repo.signOut();
          SharedPreferences.getInstance().then(
            (value) {
              value.remove(
                'auth',
              );
            },
          );
          print("sign out Succsess");
          emit(const _Unauthenticated());
        } catch (e) {
          print(e);
        }
      }
    });
  }
}
