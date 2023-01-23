import 'package:flutter/material.dart';

import '../models/models.dart';
import 'components.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  const ProductCarousel({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          scrollDirection: Axis.horizontal,
          itemCount: Product.products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ProductCard(product: Product.products[index]),
            );
          }),
    );
  }
}
