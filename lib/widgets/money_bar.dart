import 'package:flutter/material.dart';
import 'package:money_tracker/widgets/box.dart';

class MoneyBar extends StatelessWidget {
  final double money;
  final double size;
  final double topLimit;
  final double bottomLimit;
  const MoneyBar({super.key, 
    required this.money,
    required this.size,
    required this.topLimit,
    required this.bottomLimit
  });

  @override
  Widget build(BuildContext context) {
    final barWidth = 40.0;

    final halfSize = size / 2;
    final double greenBarSize = money >=0 ? money > topLimit ? halfSize : halfSize * (money / topLimit) : 0;
    final double redBarSize = money < 0 ? money < bottomLimit ? halfSize : halfSize * (money / bottomLimit) : 0;

    final greenBar = Box(
      backgroundColor: Colors.green,
      height: greenBarSize,
      width: barWidth,
    );

    final redBar = Box(
      backgroundColor: Colors.red,
      height: redBarSize,
      width: barWidth,
    );

    final fillingBarForGreen = Box(
      height: halfSize - greenBarSize,
      width: barWidth,
    );

    final fillingBarForRed = Box(
      height: halfSize - redBarSize,
      width: barWidth,
    );

    final divider = Box(
      backgroundColor: Colors.white,
      height: 2,
      width: barWidth,
    );

    return  Row(
      mainAxisSize: MainAxisSize.min,

      children: [Column(
        children:[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('R\$ $topLimit', style:TextStyle(color: Colors.grey))),
    
            
          Box(
            borderColor: Colors.grey,
            width: barWidth,
            child: Column(
              children: [
                fillingBarForGreen,
                greenBar,

                divider,
                redBar,
                fillingBarForRed,
              ],
              
            ),
          ),
          
          
        Padding(
            padding: const EdgeInsets.all(8.0),
            child:
            Text('- R\$ ${-bottomLimit}',style:TextStyle(color: Colors.grey)),),]
      ),
      MoneyLabel(money: money,)
    ],
    
    );
  }
}

class MoneyLabel extends StatelessWidget {
  final double money;
  const MoneyLabel({super.key, required this.money});

  @override
  Widget build(BuildContext context) {
    final labelColor = money >= 0 ? Colors.green : Colors.red;
    return 
      Text('R\$ ${money.toStringAsFixed(2)}', style: TextStyle(
        color: labelColor,
        fontSize: 40,
      ),);
  }
}