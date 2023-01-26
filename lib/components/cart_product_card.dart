import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart/bloc/cart_bloc.dart';
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
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return Row(
              children: [
                IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(RemoveProduct(product));
                    },
                    icon: const Icon(Icons.remove_circle)),
                Text(
                  '1',
                  style: Theme.of(context).textTheme.headline5,
                ),
                IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(AddProduct(product));
                    },
                    icon: const Icon(Icons.add_circle))
              ],
            );
          },
        )
      ],
    );
  }
}
