import 'package:equatable/equatable.dart';

sealed class MoneyEvent extends Equatable {}

class OnMoneyAdded extends MoneyEvent {
  final double money;

  OnMoneyAdded(this.money);

  @override
  List<Object> get props => [money];
}

class OnMoneySubtracted extends MoneyEvent {
  final double money;

  OnMoneySubtracted(this.money);

  @override
  List<Object> get props => [money];
}

class OnMoneyAddedByTimeDifference extends MoneyEvent {
  @override
  List<Object> get props => [];
}