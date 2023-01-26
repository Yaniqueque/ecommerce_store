import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
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
          dragStartBehavior: DragStartBehavior.start,
          itemCount: Product.products.length,
          itemBuilder: (context, index) {
            return Container(
              width: kIsWeb ? 200.0 : double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  width: kIsWeb ? 200.0 : double.infinity,
                  child: ProductCard(product: Product.products[index]),
                ),
              ),
            );
          }),
    );
  }
}
