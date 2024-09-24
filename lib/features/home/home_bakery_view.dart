import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_app/features/home/widgets/categories_chip_list.dart';
import 'package:flutter_multi_app/features/home/widgets/daily_discount_widget.dart';
import 'package:flutter_multi_app/features/home/widgets/product_list_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/service/api/model/category_model.dart';
import 'domain/home_bloc.dart';

@RoutePage()
class HomeBakeryView extends StatefulWidget {
  const HomeBakeryView({super.key});

  @override
  State<HomeBakeryView> createState() => _HomeBakeryViewState();
}

class _HomeBakeryViewState extends State<HomeBakeryView> {
  final screenUtil = ScreenUtil();
  CategoryModel? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Bar'),
        backgroundColor: const Color(0xFFf2e9e0),
      ),
      backgroundColor: const Color(0xFFf2e9e0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is HomeLoadedState) {
                final categories = state.categories;
                final discounts = state.discounts;
                final products = state.products;

                if (_selectedCategory == null) {
                  _selectedCategory = categories.firstWhere(
                        (category) => category.initial == true,
                    orElse: () => categories.first,
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DailyDiscountWidget(discounts: discounts),
                    SizedBox(height: screenUtil.setHeight(16)),
                    const Text('Categories Chips'),
                    CategoriesChipList(
                      categories: categories,
                      selectedCategory: _selectedCategory,
                      onCategorySelected: (category) {
                        setState(() {
                          _selectedCategory = category;
                        });
                      },
                    ),
                    SizedBox(height: screenUtil.setHeight(16)),
                    const Text('Bakery products'),
                    ProductListWidget(products: products),
                  ],
                );
              } else if (state is HomeErrorState) {
                return Center(child: Text('Error: ${state.error}'));
              } else {
                return const Center(child: Text('Press button to load categories'));
              }
            },
          ),
        ),
      ),
    );
  }
}
