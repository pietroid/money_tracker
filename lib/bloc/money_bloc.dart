import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:money_tracker/bloc/money_event.dart';
import 'package:money_tracker/bloc/money_state.dart';
import 'package:money_tracker/constants.dart';

class MoneyBloc extends Bloc<MoneyEvent, MoneyState> with HydratedMixin {
  MoneyBloc({required initialDateTime}) : super( MoneyState(money: 0.0, latestUpdate: initialDateTime)){
    hydrate();
    on<OnMoneyAdded>((event, emit) {
      emit(MoneyState(money: state.money + event.money, latestUpdate: DateTime.now()));
    });
    on<OnMoneySubtracted>((event, emit) {
      emit(MoneyState(money: state.money - event.money, latestUpdate: DateTime.now()));
    });
    on<OnMoneyAddedByTimeDifference>((event, emit) {
      final timeDifference = DateTime.now().difference(state.latestUpdate);
      final moneyToAdd = timeDifference.inSeconds * timeIncomeRatePerSecond;
      add(OnMoneyAdded(moneyToAdd));
    });
  }



  @override
  MoneyState fromJson(Map<String, dynamic> json) => MoneyState(money: json['money'] as double, latestUpdate: DateTime.parse(json['latestUpdate'] as String));

  @override
  Map<String, dynamic> toJson(MoneyState state) => { 'money': state.money, 'latestUpdate': state.latestUpdate.toIso8601String()};
}