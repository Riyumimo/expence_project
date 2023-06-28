import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crypto/crypto.dart';
import 'package:expence_project/logic/data/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository repo;
  final Connectivity _connectivity = Connectivity();
  AuthenticationBloc(this.repo) : super(const _Initial()) {
    // Initial
    on<_GetSignInEvent>((event, emit) async {
      // Obtain shared preferences.
      _connectivity.onConnectivityChanged.listen(
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
      // Memanggil method Signin with google
      final result = await repo.signInWithGoogle();
      // Memperbahaui event
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
      }
      emit(const _Loaded(isLoading: false));
    });

    // Sign in with Email
    on<_SignInWithEmailEvent>((event, emit) {});

    // Register With Email
    on<_RegisterWithEmailEvent>((event, emit) {
      // TODO: implement event handler
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
  // Encrypt password ke algorighma sha-256
  String encryptPassword(String password) {
    var bytes =
        utf8.encode(password); // Konversi password ke dalam bentuk bytes
    var hashedPassword = sha256
        .convert(bytes)
        .toString(); // Gunakan algoritma SHA-256 untuk hashing
    return hashedPassword;
  }
}
