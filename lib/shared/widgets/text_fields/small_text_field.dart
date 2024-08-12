import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class SmallTextField extends StatelessWidget {
  final TextEditingController controller;
  const SmallTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(32),
        child: TextField(
          cursorHeight: 18,
          controller: controller,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(
                top: 8,
                left: 16,
                right: 16,
                bottom: 8),
            filled: true,
            fillColor:
            Color.fromRGBO(238, 228, 219, 1),
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32),
              ),
              borderSide: BorderSide(
                width: 10,
                color: CustomColors.brownLight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
