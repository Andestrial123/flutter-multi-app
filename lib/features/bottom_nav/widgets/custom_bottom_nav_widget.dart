import 'package:flutter/material.dart';

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
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: paddingHorizontal,vertical: 8),
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
    );
  }
}
