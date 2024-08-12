import 'package:flutter/material.dart';
import 'package:flutter_multi_app/shared/widgets/widgets.dart';
import 'package:sign_in_button/sign_in_button.dart';

import '../../../utils/colors.dart';

class AuthTextField extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final Widget image;
  final bool isLoading;

  const AuthTextField({
    super.key,
    required this.onPressed,
    required this.text,
    required this.image,
    this.isLoading = false,
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SignInButtonBuilder(
            text: isLoading ? '' : text,
            image: isLoading ? const SizedBox() : image,
            onPressed: isLoading ? () {} : onPressed,
            backgroundColor: CustomColors.whiteColor,
            textColor: Colors.black,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.brown, width: 2.0),
              borderRadius: BorderRadius.circular(50),
            ),
            padding: const EdgeInsets.all(12),
          ),
          if (isLoading)
            const CustomCircularProgressIndicator(color: AlwaysStoppedAnimation<Color>(Colors.brown))
        ],
      ),
    );
  }
}
