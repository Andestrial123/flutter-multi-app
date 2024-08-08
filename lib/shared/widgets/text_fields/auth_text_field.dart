import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';

import '../../../utils/colors.dart';

class AuthTextField extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final Widget image;

  const AuthTextField({
    super.key,
    required this.onPressed,
    required this.text,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: SignInButtonBuilder(
        text: text,
        image: image,
        onPressed: onPressed,
        backgroundColor:  CustomColors.whiteColor,
        textColor: Colors.black,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
              color: Colors.brown,
              width: 2.0),
          borderRadius:
          BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.all(12),
      ),
    );
  }
}
