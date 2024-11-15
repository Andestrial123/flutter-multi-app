import 'package:flutter/material.dart';
import 'package:flutter_multi_app/shared/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';

class NextButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color color;
  final Color textColor;
  final bool isLoading;
  final double? height;

  const NextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color = CustomColors.brownDark,
    this.textColor = Colors.white,
    this.isLoading = false,
    this.height = 60,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(color),
          elevation: WidgetStateProperty.all(4),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        child: isLoading
            ? const CustomCircularProgressIndicator(
                color: AlwaysStoppedAnimation<Color>(Colors.white))
            : Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: textColor,
                  fontSize: ScreenUtil().setSp(18),
                ),
              ),
      ),
    );
  }
}
