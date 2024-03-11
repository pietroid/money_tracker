import 'package:flutter/material.dart';
import 'package:money_tracker/constants.dart';

class Disclaimer extends StatelessWidget {
  final double money;
  const Disclaimer({super.key,
    required this.money
  });

  @override
  Widget build(BuildContext context) {
    String _timeToZero(){
      final secondsToZeroMoney = (-money /timeIncomeRatePerSecond); 
      if(secondsToZeroMoney < 3600){
        return '${(secondsToZeroMoney / 60).floor()} minutos';
      } else if(secondsToZeroMoney < 86400){
        return '${(secondsToZeroMoney / 3600).floor()} horas';
      } else {
        return '${(secondsToZeroMoney / 86400).floor()} dias';
      }
    }

    return Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: const Color.fromARGB(255, 128, 9, 0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Começe a gastar em ${_timeToZero()}', style: TextStyle(color: Colors.white, fontSize: 15),),
              ),
            ),
          );
  }
}