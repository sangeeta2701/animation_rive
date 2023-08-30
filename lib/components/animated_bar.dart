import 'package:flutter/material.dart';


class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: 4,
      width: isActive?20:0,
      margin: EdgeInsets.only(bottom: 2),
      decoration: BoxDecoration(
        color: Color(0xff81b4ff),
        borderRadius: BorderRadius.circular(18),
      ),
    );
  }
}