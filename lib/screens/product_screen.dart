import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_store/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_store/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/models.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';
  final Product product;

  const ProductScreen({super.key, required this.product});
  static Route route({required Product product}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => ProductScreen(product: product));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: product.name,
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Container(
            height: 70,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                  ),
                  BlocBuilder<WishlistBloc, WishlistState>(
                    builder: (context, state) {
                      return IconButton(
                        onPressed: () {
                          context
                              .read<WishlistBloc>()
                              .add(AddProductToWishlist(product));

                          final snackBar =
                              SnackBar(content: Text('Added to your Wishlist'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(onPrimary: Colors.white),
                      onPressed: () {},
                      child: Text(
                        'ADD TO CART',
                        style: Theme.of(context).textTheme.headline3,
                      ))
                ]),
          )),
      body: ListView(children: [
        CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: [HeroCarouselCard(product: product)]),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                alignment: Alignment.bottomCenter,
                color: Colors.black.withAlpha(50),
              ),
              Container(
                margin: const EdgeInsets.all(5.0),
                width: MediaQuery.of(context).size.width - 10,
                height: 50,
                alignment: Alignment.bottomCenter,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            product.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        Text(
                          '${product.name}',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        )
                      ]),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ExpansionTile(
            initiallyExpanded: true,
            title: Text(
              'Product Information',
              style: Theme.of(context).textTheme.headline3,
            ),
            children: [
              ListTile(
                title: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mi dolor, vehicula sit amet ultrices vel, faucibus sed quam. Etiam convallis magna in sem tempor, et luctus metus molestie. Sed vestibulum sit amet elit in suscipit. Proin mi tortor, vehicula id consectetur sit amet, pretium id diam. Morbi bibendum risus vitae imperdiet malesuada. Praesent sit amet suscipit arcu. Suspendisse potenti. Etiam ornare nec metus non consectetur. Fusce egestas nisl ut eros lobortis condimentum. Maecenas quis arcu lacus. ',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ExpansionTile(
            title: Text(
              'Delivery Information',
              style: Theme.of(context).textTheme.headline3,
            ),
            children: [
              ListTile(
                title: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mi dolor, vehicula sit amet ultrices vel, faucibus sed quam. Etiam convallis magna in sem tempor, et luctus metus molestie. Sed vestibulum sit amet elit in suscipit. Proin mi tortor, vehicula id consectetur sit amet, pretium id diam. Morbi bibendum risus vitae imperdiet malesuada. Praesent sit amet suscipit arcu. Suspendisse potenti. Etiam ornare nec metus non consectetur. Fusce egestas nisl ut eros lobortis condimentum. Maecenas quis arcu lacus. ',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ),
      ]),
    );

    // HeroCarouselCard(product: product));
  }
}
