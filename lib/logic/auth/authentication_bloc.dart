import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:either_dart/either.dart';
import 'package:expence_project/logic/common/validate_data.dart';
import 'package:expence_project/logic/data/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/encrypt.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository repo;
  final Connectivity _connectivity;
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;

  AuthenticationBloc(this.repo, this._connectivity) : super(const _Initial()) {
    // Initial
    on<AuthenticationEvent>((event, emit) async {
      await _connectivity.onConnectivityChanged.listen((event) {
        if (event != ConnectivityResult.none) {
          print('started');
          on<_GetSignInEvent>((event, emit) async {
            // Obtain shared preferences.
            print('get started');
            if (event.firebaseAuth.currentUser != null) {
              print(event.firebaseAuth.currentUser);

              // emit(const _Authenticated());
            }
          });

          //Sign In With Google Account
          on<_SignInWithGoogleEvent>((event, emit) async {
            // Ketika Event di mulai state langsung ke _loaded true
            emit(const _Loaded(isLoading: true));

            // Memanggil method Signin with google
            final result = await repo.signInWithGoogle();
            // Memperbaharui event
            emit(_Loaded(isLoading: result.item2));
            if (result.item1 != null) {
              await SharedPreferences.getInstance().then(
                (value) {
                  value.setString('auth', result.item1!.user!.uid);
                },
              );
              print('login succsess');
              emit(const _Loaded(isLoading: false));
              emit(const _Authenticated());
            } else {
              emit(const _Loaded(isLoading: false));
            }
          });

          // Sign in with Email
          on<_SignInWithEmailEvent>((event, emit) async {
            emit(const _Loaded(isLoading: true));
            String encryptPasswod = encryptPassword(event.password);
            final result =
                await repo.signInWithEmail(event.email, encryptPasswod);
            if (result.right.item1 != null) {
              await SharedPreferences.getInstance().then(
                (value) {
                  value.setString('auth', result.right.item1!.user!.uid);
                },
              );
            }
            result.fold((left) {
              emit(_ErrorState(left));
              emit(const _Loaded(isLoading: false));
            }, (right) {
              emit(const _Authenticated());
              print(' wtih email login succsess');
              emit(_Loaded(isLoading: right.item2));
            });
          });

          // Register With Email
          on<_RegisterWithEmailEvent>((event, emit) async {
            print('register');
            emit(const _Loaded(isLoading: true));
            final validate = ValidateData();
            String? email = validate.validateEmail(event.email);
            String? pass = validate.validatePassword(event.password);

            //validasi state yang akan di keluarkan berdasarkan if statement
            if (email != null) {
              emit(_$_ErrorState(email));
              emit(const _Loaded(isLoading: true));
            } else if (pass != null) {
              emit(_$_ErrorState(pass));
              emit(const _Loaded(isLoading: true));
            } else {
              String encryptPasswod = encryptPassword(event.password);
              await repo.registerWithEmail(event.email, encryptPasswod);
              emit(const _Loaded(isLoading: true));
              emit(const _ErrorState('Register Succsess'));
            }
          });

          //Sign Out
          on<_SignOutEvent>((event, emit) async {
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
          });
        } else {
          emit(_ErrorState(event.toString()));
        }
      }).asFuture();
    });
  }

  void dispose() {
    _connectivitySubscription?.cancel();
  }
}
