import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
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
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;

  AuthenticationBloc(this.repo) : super(const _Initial()) {
    // Initial
    on<_GetSignInEvent>((event, emit) async {
      // Obtain shared preferences.
      _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
        (result) {
          if (result != ConnectivityResult.none) {
            print('get started');
            if (event.firebaseAuth.currentUser != null) {
              print(event.firebaseAuth.currentUser);

              emit(const _Authenticated());
            } else {
              emit(const _Initial());
            }
          } else {
            // Jika Tidak Ada internet disaat inistate
            emit(_ErrorState("Internet error:$result"));
          }
        },
        onError: (Object error) {
          // Handle error
          print('Error occurred: $error');
        },
        onDone: () {
          // Stream is done
          print('Stream is done');
        },
      );
    });

    //Sign In With Google Account
    on<_SignInWithGoogleEvent>((event, emit) async {
      // Ketika Event di mulai state langsung ke _loaded true
      emit(const _Loaded(isLoading: true));
      _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
        (event) async {
          if (event != ConnectivityResult.none) {
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
          }
        },
        onError: (Object error) {
          // Handle error
          emit(_ErrorState("Internet error:$error"));
          print('Error occurred: $error');
        },
        onDone: () {
          // Stream is done
          print('Stream is done');
        },
      );
    });

    // Sign in with Email
    on<_SignInWithEmailEvent>((event, emit) {
      emit(const _Loaded(isLoading: true));
      _connectivitySubscription =
          _connectivity.onConnectivityChanged.listen((connection) async {
        if (connection == ConnectivityResult.none) {
          final result =
              await repo.signInWithEmail(event.email, event.password);
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
            emit(_Loaded(isLoading: result.item2));
          }
        } else {
          emit(const _Loaded(isLoading: false));
          emit(_ErrorState(connection.toString()));
        }
      });
    });

    // Register With Email
    on<_RegisterWithEmailEvent>((event, emit) async {
      _connectivitySubscription =
          _connectivity.onConnectivityChanged.listen((connection) async {
        if (connection != ConnectivityResult.none) {
          final validate = ValidateData();
          String? email = validate.validateEmail(event.email);
          String? pass = validate.validatePassword(event.password);

          //validasi state yang akan di keluarkan berdasarkan if statement
          if (email != null) {
            emit(_$_ErrorState(email));
          } else if (pass != null) {
            emit(_$_ErrorState(pass));
          } else {
            String encryptPasswod = encryptPassword(event.password);
            await repo.registerWithEmail(event.email, encryptPasswod);
            print("Register Succsess ");
          }
        } else {
          emit(_ErrorState(connection.toString()));
        }
      });
    });

    //Sign Out
    on<_SignOutEvent>((event, emit) async {
      _connectivitySubscription =
          _connectivity.onConnectivityChanged.listen((event) async {
        if (event != ConnectivityResult.none) {
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
        }
      });
    });
  }

  void dispose() {
    _connectivitySubscription?.cancel();
  }
}
