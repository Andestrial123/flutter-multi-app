import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_multi_app/utils/colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<BottomNavigationBarItem> items;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final double iconSize;
  final double paddingHorizontal;
  final double itemSpacing;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    this.selectedItemColor = Colors.blue,
    this.unselectedItemColor = Colors.grey,
    this.iconSize = 24.0,
    this.paddingHorizontal = 24.0,
    this.itemSpacing = 30.0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: Container(
            decoration: const BoxDecoration(
              color: CustomColors.whiteColor,
            ),
            padding: EdgeInsets.only(
              left: paddingHorizontal,
              right: paddingHorizontal,
              bottom: 8 + (Platform.isIOS ? 16 : 0),
              top: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: items.map((item) {
                int index = items.indexOf(item);
                return InkWell(
                  onTap: () => onTap(index),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: itemSpacing / 2),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconTheme(
                          data: IconThemeData(
                            size: iconSize,
                            color: currentIndex == index
                                ? selectedItemColor
                                : unselectedItemColor,
                          ),
                          child: item.icon,
                        ),
                        if (item.label != null)
                          Text(
                            item.label!,
                            style: TextStyle(
                              color: currentIndex == index
                                  ? selectedItemColor
                                  : unselectedItemColor,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 4,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.6),
                  blurRadius: 6,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
