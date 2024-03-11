import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final Color? borderColor;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final Widget? child;

  const Box({super.key,
    this.borderColor,
    this.backgroundColor,
    this.height,
    this.width,
    this.child
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(border: borderColor != null ? Border.all(color: borderColor!): null, color: backgroundColor),
        child: SizedBox(
          height: height,
          width: width,
          child: child,),
      );
  }
}