import 'package:flutter/material.dart';
import 'package:flutter_multi_app/shared/widgets/widgets.dart';

import '../../../utils/colors.dart';

class NextButtonOutlined extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color color;
  final Color textColor;
  final bool isLoading;
  final double? height;
  final FontWeight? fontWeight;

  const NextButtonOutlined({
    super.key,
    required this.onPressed,
    required this.text,
    this.color = CustomColors.brownDark,
    this.textColor = Colors.white,
    this.isLoading = false,
    this.height = 60,
    this.fontWeight = FontWeight.w300,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: ButtonStyle(
          side: WidgetStateProperty.all(
            const BorderSide(
              color: CustomColors.brownDark,
              width: 3,
            ),
          ),
          elevation: WidgetStateProperty.all(4),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        child: isLoading
            ? const CustomCircularProgressIndicator(
                color: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            : Text(
                text,
                style: TextStyle(
                  fontWeight: fontWeight,
                  color: textColor,
                  fontSize: 18,
                ),
              ),
      ),
    );
  }
}
