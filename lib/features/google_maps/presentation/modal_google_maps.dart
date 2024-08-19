import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_app/shared/assets/assets.dart';
import 'package:flutter_multi_app/shared/translation/locale_keys.dart';
import 'package:flutter_multi_app/shared/widgets/buttons/next_button.dart';
import 'package:flutter_multi_app/utils/app_route.gr.dart';
import 'package:flutter_multi_app/utils/colors.dart';
import 'package:flutter_multi_app/utils/typography.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ModalGoogleMaps extends StatefulWidget {
  const ModalGoogleMaps({super.key, required this.controller, required this.address});

  final DraggableScrollableController controller;
  final String address;

  @override
  State<ModalGoogleMaps> createState() => _ModalGoogleMapsState();
}

class _ModalGoogleMapsState extends State<ModalGoogleMaps> {
  String formatText(String text, int chunkSize) {
    List<String> chunks = [];
    for (int i = 0; i < text.length; i += chunkSize) {
      chunks.add(text.substring(
          i, i + chunkSize > text.length ? text.length : i + chunkSize));
    }
    return chunks.join('\n');
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: widget.controller,
      snap: true,
      initialChildSize: 0,
      minChildSize: 0,
      maxChildSize: 0.4,
      builder: (context, scrollController) {
        final screenSize = MediaQuery.of(context).size;
        final imageHeight = screenSize.height * 0.1;
        final imageWidth = imageHeight * 120 / 85;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
              color: CustomColors.whiteColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(22),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MultiAppTypography(
                              TypographyType.headline2,
                              LocaleKeys.bakery.tr(),
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MultiAppTypography(
                              TypographyType.bigTextThin,
                              formatText(
                                  widget.address,
                                  26),
                              color: Colors.black,
                            ),
                            const SizedBox(height: 16),
                            MultiAppTypography(
                              TypographyType.bigTextThin,
                              LocaleKeys.bakeryHours.tr(),
                              color: Colors.black,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: LocaleKeys.openNow.tr(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: '${LocaleKeys.closesAt.tr()} 7:30 PM',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            MultiAppTypography(
                              TypographyType.bigTextThin,
                              LocaleKeys.deliveryHours.tr(),
                              color: Colors.black,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: LocaleKeys.openNow.tr(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: '${LocaleKeys.closesAt.tr()} 6:30 PM',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: ScreenUtil().setSp(100),
                            maxWidth: ScreenUtil().setSp(150),
                          ),
                          child: NextButton(
                            onPressed: () {
                              AutoRouter.of(context).replaceAll([const HomeRoute()]);
                            },
                            text: LocaleKeys.viewMenu.tr(),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Positioned(
                    right: 15,
                    top: MediaQuery.of(context).size.height * 0.2 / 2.2,
                    child: SizedBox(
                      height: imageHeight,
                      width: imageWidth,
                      child: Image.asset(
                        Assets.mainBakery,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}