import 'package:flutter/material.dart';

///  Created by mac on 21/1/23.
class GradientWrapper extends StatelessWidget {
  List<Color> colors;
  final Widget child;

  GradientWrapper({
    super.key,
    this.colors = const [
      Color(0xff513d79),
      Color(0xff362654),
      Color(0xff22133c),
      Color(0xff3d1856),
      Color(0xff551560),
    ],
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: <Color>[...colors],
        ),
      ),
      child: child,
    );
  }
}
