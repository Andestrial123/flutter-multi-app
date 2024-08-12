import 'package:flutter/material.dart';
import 'package:flutter_multi_app/utils/colors.dart';

const divider = Divider(
  color: CustomColors.brownLight,
);

class CustomCircularProgressIndicator extends StatelessWidget {
  final AlwaysStoppedAnimation<Color> color;

  const CustomCircularProgressIndicator({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: CircularProgressIndicator(
        valueColor: color,
        strokeWidth: 2,
      ),
    );
  }
}
