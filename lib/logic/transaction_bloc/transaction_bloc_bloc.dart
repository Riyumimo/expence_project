import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_bloc_event.dart';
part 'transaction_bloc_state.dart';
part 'transaction_bloc_bloc.freezed.dart';

class TransactionBlocBloc extends Bloc<TransactionBlocEvent, TransactionBlocState> {
  TransactionBlocBloc() : super(_Initial()) {
    on<TransactionBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
