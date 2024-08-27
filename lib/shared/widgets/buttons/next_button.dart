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

  const NextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color = CustomColors.brownDark,
    this.textColor = Colors.white,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          elevation: MaterialStateProperty.all(4),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        child: isLoading
            ? const CustomCircularProgressIndicator(color: AlwaysStoppedAnimation<Color>(Colors.white))
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
