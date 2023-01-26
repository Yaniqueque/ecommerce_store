import 'package:ecommerce_store/components/components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/wishlist/wishlist_bloc.dart';
import '../models/models.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = 'wishlist';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => WishlistScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: kIsWeb ? 400.0 : double.infinity,
            child: (Scaffold(
              body: BlocBuilder<WishlistBloc, WishlistState>(
                builder: (context, state) {
                  if (state is WishlistLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is WishlistLoaded) {
                    return GridView.builder(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 16.0,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 1.15),
                        itemCount: state.wishlist.products.length,
                        itemBuilder: (BuildContext context, index) {
                          return Center(
                            child: ProductCard(
                              product: state.wishlist.products[index],
                              isWishlist: true,
                            ),
                          );
                        });
                  } else {
                    return const Text('Something went wrong');
                  }
                },
              ),
              appBar: CustomAppBar(
                title: 'Wishlist',
              ),
              bottomNavigationBar: CustomNavigation(),
            ))));
  }
}
