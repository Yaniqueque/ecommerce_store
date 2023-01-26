import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart/bloc/cart_bloc.dart';
import '../blocs/wishlist/wishlist_bloc.dart';
import '../models/models.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final bool isWishlist;
  const ProductCard({
    Key? key,
    required this.product,
    this.isWishlist = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            //width: kIsWeb ? 200.0 : double.infinity,
            child: (InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: product);
      },
      child: Container(
        //width: kIsWeb ? 200.0 : double.infinity,
        child: Stack(
          children: [
            Container(
              width:
                  // kIsWeb ? 400.0 : double.infinity,
                  //    MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.width / 2.5,
              height: 150,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 60,
              child: Container(
                  // width: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 80,
                  decoration: BoxDecoration(color: Colors.black.withAlpha(50))),
            ),
            Positioned(
              top: 85,
              //left: 5,
              child: Container(
                  // width: MediaQuery.of(context).size.width ,
                  width: MediaQuery.of(context).size.width / 2.5 - 10,
                  height: 70,
                  decoration: BoxDecoration(color: Colors.black),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              '\$${product.price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            if (state is CartLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (state is CartLoaded) {
                              return IconButton(
                                onPressed: () {
                                  context
                                      .read<CartBloc>()
                                      .add(AddProduct(product));
                                },
                                icon: Icon(
                                  Icons.add_circle,
                                  color: Colors.white,
                                ),
                              );
                            } else {
                              return Text('Something went wrong');
                            }
                          },
                        ),
                        isWishlist
                            ? Expanded(
                                child: IconButton(
                                  onPressed: () {
                                    context.read<WishlistBloc>().add(
                                        RemoveProductFromWishlist(product));
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : SizedBox()
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
      // ),
    ))));
  }
}
