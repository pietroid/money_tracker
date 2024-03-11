import 'package:equatable/equatable.dart';

class MoneyState extends Equatable {
  final double money;
  final DateTime latestUpdate;

  const MoneyState({required this.money, required this.latestUpdate});

  @override
  List<Object> get props => [money, latestUpdate];
}