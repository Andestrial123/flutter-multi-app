import 'package:flutter/material.dart';
import '../../../shared/service/api/model/category_model.dart';

class CategoriesChipList extends StatelessWidget {
  final List<CategoryModel> categories;
  final CategoryModel? selectedCategory;
  final Function(CategoryModel) onCategorySelected;

  const CategoriesChipList({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    // Separate the selected category from the rest
    List<CategoryModel> unselectedCategories = categories
        .where((category) => category.id != selectedCategory?.id)
        .toList();

    // Sort the unselected categories alphabetically by name
    unselectedCategories.sort((a, b) => a.name!.compareTo(b.name!));

    // Add the selected category to the beginning of the list
    List<CategoryModel> reorderedCategories = [];
    if (selectedCategory != null) {
      reorderedCategories.add(selectedCategory!);
    }
    reorderedCategories.addAll(unselectedCategories);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Categories',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        SizedBox(
          height: 40.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: reorderedCategories.length,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemBuilder: (context, index) {
              final category = reorderedCategories[index];
              final isSelected = category.id == selectedCategory?.id;

              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ChoiceChip(
                  label: Text(category.name ?? ''),
                  selected: isSelected,
                  selectedColor: Colors.brown,
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.brown,
                  ),
                  onSelected: (_) {
                    onCategorySelected(category);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: const BorderSide(color: Colors.brown),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
