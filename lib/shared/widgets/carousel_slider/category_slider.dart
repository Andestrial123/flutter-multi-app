import 'package:flutter/material.dart';
import 'package:flutter_multi_app/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategorySlider extends StatefulWidget {
  const CategorySlider({super.key});

  @override
  State<CategorySlider> createState() => _CategorySliderState();
}

class _CategorySliderState extends State<CategorySlider> {
  final List<String> categories = [
    "Cakes",
    "Desserts",
    "Sweet Surprises",
    "Smoothies",
    "Beverages",
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().setHeight(24),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final bool isSelected = _selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.only(
                left: index == 0 ? 12 : 4,
                right: 4,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: isSelected ? CustomColors.brownDark : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: CustomColors.brownDark,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  categories[index],
                  style: TextStyle(
                    color: isSelected
                        ? CustomColors.whiteColor
                        : CustomColors.brownLight,
                    fontWeight: FontWeight.w500,
                    fontSize: ScreenUtil().setHeight(14),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
