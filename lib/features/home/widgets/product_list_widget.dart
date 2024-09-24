import 'package:flutter/material.dart';
import '../../../shared/service/api/model/products_model.dart';
import 'bakery_item_widget.dart';

class ProductListWidget extends StatelessWidget {
  final List<ProductsModel> products;

  const ProductListWidget({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
        ),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 2 / 2.9,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return BakeryItemWidget(
              imageUrl: product.imageUrl,
              title: product.name,
              description: product.description,
              price: product.price,
            );
          },
        ),
      ),
    );
  }
}
