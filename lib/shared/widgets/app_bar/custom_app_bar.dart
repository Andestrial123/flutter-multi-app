import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_app/shared/translation/locale_keys.dart';
import 'package:flutter_multi_app/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    super.key,
    required String subTitle,
    required VoidCallback onPressed,
  }) : super(
          toolbarHeight: 100,
          centerTitle: false,
          backgroundColor: CustomColors.whiteColor,
          title: Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.cupcakeBakeryShop.tr(),
                  style: TextStyle(
                    color: CustomColors.brownDark,
                    fontSize: ScreenUtil().setHeight(16),
                    fontFamily: 'CustomFont',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subTitle,
                  style: TextStyle(
                    color: CustomColors.lightRedColor,
                    fontSize: ScreenUtil().setHeight(14),
                    fontFamily: 'CustomFont',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 32),
              child: IconButton(
                onPressed: onPressed,
                icon: const Icon(Icons.shopping_basket_outlined),
                iconSize: 34,
                color: Colors.grey,
              ),
            ),
          ],
        );
}
