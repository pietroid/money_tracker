import 'package:flutter/material.dart';
import 'package:money_tracker/bloc/money_bloc.dart';
import 'package:money_tracker/bloc/money_event.dart';
import 'package:provider/provider.dart';

class MoneyDialog extends StatefulWidget {
  final bool isSpending;
  const MoneyDialog({super.key, required this.isSpending});

  @override
  State<MoneyDialog> createState() => _MoneyDialogState();
}

class _MoneyDialogState extends State<MoneyDialog> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
            TextField(
              controller: textController,
              style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Valor',
              border: OutlineInputBorder(),
              labelStyle: TextStyle(
                color: Colors.grey,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            final moneyBloc = context.read<MoneyBloc>();
            if(widget.isSpending){
              moneyBloc.add(OnMoneySubtracted(double.parse(textController.text)));
            } else {
              moneyBloc.add(OnMoneyAdded(double.parse(textController.text)));
            }
            Navigator.of(context).pop();
          }, child:  Text(widget.isSpending ? 'Gastar': 'Ganhar', style:TextStyle(fontSize: 20)),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(widget.isSpending ? Colors.red : Colors.green), padding: MaterialStateProperty.all(EdgeInsets.all(20.0))),)
        ],
      );
  }
}