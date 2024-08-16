import 'package:flutter/material.dart';
import 'package:flutter_multi_app/shared/assets/assets.dart';
import 'package:flutter_multi_app/utils/colors.dart';
import 'package:flutter_multi_app/utils/typography.dart';

class ModalGoogleMaps extends StatefulWidget {
  const ModalGoogleMaps({super.key, required this.controller});

  final DraggableScrollableController controller;


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
      initialChildSize: 0,
      minChildSize: 0,
      maxChildSize: 0.35,
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
                      const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MultiAppTypography(
                              TypographyType.headline2,
                              'Bakery',
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
                                  '4840 Bates Brothers Road, San Francisco, USA',
                                  26),
                              color: Colors.black,
                            ),
                            const SizedBox(height: 16),
                            const MultiAppTypography(
                              TypographyType.bigTextThin,
                              'Bakery Hours',
                              color: Colors.black,
                            ),
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Open Now - ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: 'Closes at 7:30 PM',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            const MultiAppTypography(
                              TypographyType.bigTextThin,
                              'Delivery Hours',
                              color: Colors.black,
                            ),
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Open Now - ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: 'Closes at 6:00 PM',
                                    style: TextStyle(
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
                    ],
                  ),
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