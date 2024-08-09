import 'package:flutter/material.dart';
import 'package:flutter_multi_app/utils/colors.dart';

const divider = Divider(
  color: CustomColors.brownLight,
);
const progressIndicatorLight = SizedBox(
  width: 24,
  height: 24,
  child: CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
    strokeWidth: 2,
  ),
);

const progressIndicatorDark = SizedBox(
  width: 24,
  height: 24,
  child: CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation<Color>(Colors.brown),
    strokeWidth: 2,
  ),
);
