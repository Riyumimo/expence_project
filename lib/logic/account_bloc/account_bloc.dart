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

  Future<void> setAccountStatus(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('account', status);
  }

  AccountBloc(this._storageRepository) : super(const _Initial()) {
    List<Account> listAccount = [];
    on<_Started>((event, emit) async {
      try {
        final data = await _storageRepository.getAccount();
        print('data from firebase $data');
        //if Statement
        if (data == null) {
          await setAccountStatus(false);
          emit(const _Error('Account is empity'));
          if (listAccount.isEmpty) {
            await setAccountStatus(false);
            print('account is empity');
            emit(_Loaded(listAccount));
          }
        } else {
          //else
          for (var element in data!) {
            listAccount.add(element);
          }
          await setAccountStatus(true);
          emit(_Loaded(listAccount));
        }
        //exception
      } on Exception catch (e) {
        print('Error occurred while fetching accounts: $e');
        emit(const _Error('Error fetching accounts'));
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
        await setAccountStatus(true);
      }
    });

    on<_DeletedEvent>((event, emit) async {
      try {
        if (listAccount.isEmpty) {
          emit(const _Error('this user has no account '));
        }
        await _storageRepository.deleteAccount();
        listAccount.clear();
        setAccountStatus(false);
      } on Exception catch (e) {
        // TODO
        print(e);
        rethrow;
      }
    });
  }
}
