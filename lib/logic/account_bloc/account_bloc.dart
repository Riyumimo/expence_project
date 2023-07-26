import 'package:bloc/bloc.dart';
import 'package:expence_project/data/firebase_service/storage_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/account.dart';

part 'account_state.dart';
part 'account_event.dart';
part 'account_bloc.freezed.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final StorageRepository _storageRepository;
  AccountBloc(this._storageRepository) : super(const _Initial()) {
    on<_Started>((event, emit) async {
      List listAccount = [];
      print('bloc_account started');
      if (listAccount.isEmpty) {
        await SharedPreferences.getInstance()
            .then((value) => value.setBool('account', false));
        print('complete');
        // emit(const _Loaded([]));
      }
    });
    on<_AddEvent>((event, emit) async {
      if (event.accountName.isEmpty) {
        emit(const _Error('Account name cannot be empty'));
      } else if (event.initialBalance <= 0) {
        emit(const _Error('Initial balance must be a positive number'));
      } else if (event.accountType.isEmpty) {
        emit(const _Error('Please select an account type'));
      } else {
        // Semua validasi berhasil, tambahkan akun
        _storageRepository.addAccount(Account(
          accountName: event.accountName,
          name: event.name,
          initialBalance: event.initialBalance.toDouble(),
          accountType: event.accountType,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ));
      }
    });
  }
}
