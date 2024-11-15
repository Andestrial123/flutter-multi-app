import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_app/features/finish_screen/widgets/finish_screen_background.dart';
import 'package:flutter_multi_app/shared/assets/assets.dart';
import 'package:flutter_multi_app/shared/assets/routes.dart';
import 'package:flutter_multi_app/shared/translation/locale_keys.dart';
import 'package:flutter_multi_app/shared/widgets/buttons/next_button.dart';
import 'package:flutter_multi_app/shared/widgets/text/custom_title.dart';
import 'package:flutter_multi_app/utils/colors.dart';
import 'package:flutter_multi_app/utils/typography.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class FinishScreen extends StatelessWidget {
  const FinishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenUtil = ScreenUtil();
    return Scaffold(
      backgroundColor: CustomColors.whiteColor,
      body: CustomPaint(
        painter: FinishScreenBackground(),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTitle(
                    text: LocaleKeys.thankYou.tr(),
                    fontSize: 34,
                  ),
                  const SizedBox(height: 4),
                  MultiAppTypography(TypographyType.bigTextBold,
                      LocaleKeys.forYourPurchase.tr()),
                  const SizedBox(height: 64),
                  MultiAppTypography(
                      TypographyType.bigTextBold, LocaleKeys.contactUs.tr()),
                  const SizedBox(height: 4),
                  MultiAppTypography(
                      TypographyType.bigText, LocaleKeys.numberEmail.tr()),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: screenUtil.setHeight(16)),
                child: SizedBox(
                  width: screenUtil.setWidth(180),
                  child: SafeArea(
                    child: NextButton(
                      onPressed: () {
                        context.router.pushNamed('/${Routes.home}');
                      },
                      text: LocaleKeys.homePage.tr(),
                      textColor: CustomColors.brownDark,
                      color: CustomColors.buttonColor,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: -screenUtil.setHeight(50),
              left: -screenUtil.setWidth(55),
              child: Image.asset(
                Assets.plate,
                fit: BoxFit.cover,
                height: screenUtil.setHeight(300),
                width: screenUtil.setWidth(300),
              ),
            ),
            Positioned(
              top: screenUtil.setHeight(165),
              left: screenUtil.setWidth(150),
              child: Transform.rotate(
                angle: -3.14 / -1.1,
                child: Image.asset(
                  Assets.mintLeaf,
                  height: screenUtil.setHeight(60),
                  width: screenUtil.setWidth(60),
                ),
              ),
            ),
            Positioned(
              top: -screenUtil.setHeight(50),
              child: Container(
                constraints: BoxConstraints(
                    maxHeight: screenUtil.setHeight(230),
                    maxWidth: screenUtil.screenWidth),
                child: Row(
                  children: [
                    const Spacer(flex: 4),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Transform.rotate(
                          angle: 3.14 / -2,
                          child: Image.asset(
                            Assets.mintLeaf,
                            height: screenUtil.setHeight(45),
                            width: screenUtil.setWidth(45),
                          ),
                        ),
                        SizedBox(height: screenUtil.setHeight(6)),
                        Transform.rotate(
                          angle: 3.14 / -4,
                          child: Image.asset(
                            Assets.strawberry,
                            height: screenUtil.setHeight(50),
                            width: screenUtil.setWidth(50),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
