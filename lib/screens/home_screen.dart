import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_store/components/components.dart';
import 'package:ecommerce_store/models/category_model.dart';
import 'package:ecommerce_store/models/models.dart';
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
    return Scaffold(
      appBar: CustomAppBar(
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
              items: Category.categories
                  .map((category) => HeroCarouselCard(category: category))
                  .toList(),
            ),
          ),
          SectionTitle(title: "RECOMMENDED"),
          //Product Carousel

          //ProductCard(product: Product.products[0],),

          ProductCarousel(
            products: Product.products
                .where((product) => product.isRecommended)
                .toList(),
          ),

          SectionTitle(title: "MOST POPULAR"),
          //Product Carousel

          //ProductCard(product: Product.products[0],),

          ProductCarousel(
            products:
                Product.products.where((product) => product.isPopular).toList(),
          )
        ],
      ),
    );
  }
}
