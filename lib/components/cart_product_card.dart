import 'package:flutter/material.dart';

import '../models/models.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  const CartProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.network(
          product.imageUrl,
          width: 100,
          height: 90,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              '\$${product.price}',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.remove_circle)),
            Text(
              '1',
              style: Theme.of(context).textTheme.headline5,
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle))
          ],
        )
      ],
    );
  }
}
