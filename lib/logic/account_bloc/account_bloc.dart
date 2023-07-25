import 'package:bloc/bloc.dart';
import 'package:expence_project/commons_libs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/account.dart';

part 'account_state.dart';
part 'account_event.dart';
part 'account_bloc.freezed.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(_Initial()) {
    on<_Started>((event, emit) async {
      print('bloc_account started');
      List listAccount = [];
      if (listAccount.isEmpty) {
        await SharedPreferences.getInstance()
            .then((value) => value.setBool('account', false));
        print('complete');
        // emit(const _Loaded([]));
      }
    });
    on<_AddEvent>((event, emit) {});
  }
}
