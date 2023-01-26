import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_store/components/components.dart';
import 'package:ecommerce_store/models/models.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: kIsWeb ? 400.0 : double.infinity,
        child: Scaffold(
          appBar: const CustomAppBar(
            title: 'TechGoodies',
          ),
          bottomNavigationBar: CustomNavigation(),
          body: Column(
            children: [
              Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: false,
                    aspectRatio: 1.5,
                    enlargeCenterPage: true,
                  ),
                  items: Category_.categories
                      .map((category) => HeroCarouselCard(category: category))
                      .toList(),
                ),
              ),
              SectionTitle(title: "RECOMMENDED"),
              //Product Carousel

              //ProductCard(product: Product.products[0],),

              Container(
                //width: kIsWeb ? 100.0 : double.infinity,
                child: ProductCarousel(
                  products: Product.products
                      .where((product) => product.isRecommended)
                      .toList(),
                ),
              ),

              SectionTitle(title: "MOST POPULAR"),
              //Product Carousel

              //ProductCard(product: Product.products[0],),

              Container(
                // width: kIsWeb ? 400.0 : double.infinity,
                child: ProductCarousel(
                  products: Product.products
                      .where((product) => product.isPopular)
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
