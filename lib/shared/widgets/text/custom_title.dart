import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class CustomTitle extends StatelessWidget {
  final String text;
  final Color? color;

  const CustomTitle({
    super.key,
    required this.text,
    this.color = CustomColors.brownDark,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'CustomFont',
        fontSize: 28,
        color: color,
        shadows: const [
          Shadow(
            offset: Offset(0.3, 0.9),
            blurRadius: 3.0,
            color: Color.fromARGB(128, 0, 0, 0),
          ),
        ],
      ),
    );
  }
}
