import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_app/shared/translation/locale_keys.dart';
import 'package:flutter_multi_app/utils/custom_background.dart';
import 'package:flutter_multi_app/shared/assets/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenUtil = ScreenUtil();

    return Scaffold(
      backgroundColor: const Color(0xFFf2e9e0),
      body: CustomPaint(
        painter: CustomBackgroundPainter(),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: -screenUtil.setHeight(50),
                right: -screenUtil.setWidth(50),
                child: Image.asset(Assets.plate,
                    fit: BoxFit.cover,
                    height: screenUtil.setHeight(300),
                    width: screenUtil.setWidth(300)),
              ),
              Positioned(
                top: 0,
                child: Container(
                  constraints: BoxConstraints(
                      maxHeight: screenUtil.setHeight(230),
                      maxWidth: screenUtil.screenWidth),
                  child: Row(
                    children: [
                      const Spacer(
                        flex: 4,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            Assets.mintLeaf,
                            height: screenUtil.setHeight(50),
                            width: screenUtil.setWidth(50),
                          ),
                          SizedBox(
                            height: screenUtil.setHeight(6),
                          ),
                          Image.asset(
                            Assets.strawberry,
                            height: screenUtil.setHeight(50),
                            width: screenUtil.setWidth(50),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: screenUtil.setWidth(20),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          Assets.mintLeaf,
                          height: screenUtil.setHeight(50),
                          width: screenUtil.setWidth(50),
                        ),
                      ),
                      const Spacer(
                        flex: 7,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 20, right: 16),
                child: Column(
                  children: [
                    const Spacer(flex: 4),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          LocaleKeys.lorem1.tr(),
                          style: TextStyle(
                              color: Colors.brown,
                              fontSize: ScreenUtil().setSp(16),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          LocaleKeys.lorem2.tr(),
                          style: TextStyle(
                            color: Colors.brown,
                            fontSize: ScreenUtil().setSp(16),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(flex: 2),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 40.0),
                          foregroundColor: const Color(0xFFf3e1d4),
                          backgroundColor: const Color(0xFFf3e1d4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          LocaleKeys.getStarted.tr(),
                          style: TextStyle(
                              color: Colors.brown,
                              fontWeight: FontWeight.w400,
                              fontSize: screenUtil.setSp(16)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
