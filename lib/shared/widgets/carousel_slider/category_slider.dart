import 'package:flutter/material.dart';
import 'package:flutter_multi_app/shared/service/api/model/category_model.dart';
import 'package:flutter_multi_app/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategorySlider extends StatefulWidget {
  final List<CategoryModel> data;

  const CategorySlider({super.key, required this.data});

  @override
  State<CategorySlider> createState() => _CategorySliderState();
}

class _CategorySliderState extends State<CategorySlider> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().setHeight(24),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.data.length,
        itemBuilder: (context, index) {
          final bool isSelected = _selectedIndex == index;
          final category = widget.data[index];

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
                  category.name ?? 'Category',
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
