import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_app/shared/translation/locale_keys.dart';
import 'package:flutter_multi_app/shared/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_multi_app/shared/widgets/carousel_slider/category_slider.dart';
import 'package:flutter_multi_app/shared/widgets/carousel_slider/custom_carousel_slider.dart';
import 'package:flutter_multi_app/shared/widgets/grid/custom_grid.dart';
import 'package:flutter_multi_app/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.whiteColor,
      appBar: CustomAppBar(
        subTitle: LocaleKeys.home.tr(),
        onPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                LocaleKeys.dailyDiscounts.tr(),
                style: TextStyle(
                    fontSize: ScreenUtil().setHeight(14),
                    color: CustomColors.brownDark,
                    fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(height: 16),
            const CustomCarouselSlider(),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                LocaleKeys.categories.tr(),
                style: TextStyle(
                    fontSize: ScreenUtil().setHeight(14),
                    color: CustomColors.brownDark,
                    fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(height: 16),
            const CategorySlider(),
            const SizedBox(height: 16),
            const CustomGrid(),
          ],
        ),
      ),
    );
  }
}
