import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_app/dto/balances.dart';
import 'package:my_app/services/data_services.dart';

part 'balance_state.dart';

class BalanceCubit extends Cubit<BalanceState> {
  BalanceCubit() : super(BalanceInitialState());

  Future<void> fetchBalance() async {
    try {
      debugPrint("fire api");
      int fetchedBalance;
      List<Balances>? balances;
      balances = await DataService.fetchBalances();
      fetchedBalance = balances[0].balance;
      emit(BalanceState(balance: fetchedBalance));
    } catch (e) {
      debugPrint("Error Fetched Data"); // Handle errors more gracefully
    }
  }

  void updateBalance(int spending) {
    final int newBalance = state.balance - spending;
    emit(BalanceState(balance: newBalance));
  }
}

