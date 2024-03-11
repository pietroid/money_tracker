import 'package:flutter/material.dart';
import 'package:money_tracker/bloc/money_bloc.dart';
import 'package:money_tracker/bloc/money_event.dart';
import 'package:money_tracker/screens/money_dialog.dart';
import 'package:money_tracker/widgets/disclaimer.dart';
import 'package:money_tracker/widgets/money_bar.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    final moneyBloc = context.read<MoneyBloc>();
    context.watch<MoneyBloc>();
    final money = moneyBloc.state.money;

    return  Scaffold(
      body: Stack(
        children:[ Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MoneyBar(money: money
              , size: 200
              , topLimit: 100
              , bottomLimit: -100
              
              ),
            ],
          ),
        ),
        if(money < 0)
          Disclaimer(money: money)
        ]
      ),
      floatingActionButton:Column(mainAxisAlignment: MainAxisAlignment.end,children: [ FloatingActionButton(
        onPressed: () {
          //TODO: add dialog
          showDialog(context: context, builder: 
            (BuildContext context) {
              return AlertDialog(
                content: MoneyDialog(isSpending: false),
              );
            }
          );
        },
        tooltip: 'Adicionar dinheiro',
        child: Icon(Icons.add, color: Color.fromARGB(255, 110, 255, 120),),
        backgroundColor: Color.fromARGB(255, 0, 127, 4),
      ),
      SizedBox(height: 20,),
      FloatingActionButton(
        onPressed: () {
          //TODO: add dialog
          showDialog(context: context, builder: 
            (BuildContext context) {
              return AlertDialog(
                content: MoneyDialog(isSpending: true),
              );
            }
          );
        },
        tooltip: 'Subtrair dinheiro',
        child: Icon(Icons.remove, color: const Color.fromARGB(255, 255, 95, 95),),
        backgroundColor: Color.fromARGB(255, 134, 0, 0)
      ),
    ]));
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    final moneyBloc = context.read<MoneyBloc>();
    if (state == AppLifecycleState.resumed){
        moneyBloc.add(OnMoneyAddedByTimeDifference());
    }
  }
}