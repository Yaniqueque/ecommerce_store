import 'package:ecommerce_store/components/components.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';
  final Category category;
  const CatalogScreen({super.key, required this.category});

  static Route route({required Category category}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => CatalogScreen(category: category));
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products
        .where((product) => product.category == category.name)
        .toList();
    return Scaffold(
        appBar: CustomAppBar(
          title: category.name,
        ),
        bottomNavigationBar: CustomNavigation(),
        body: GridView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 16.0,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1.15),
            itemCount: categoryProducts.length,
            itemBuilder: (BuildContext context, index) {
              return Center(
                child: ProductCard(
                  product: categoryProducts[index],
                ),
              );
            }));

    //ProductCard(product: Product.products[0]),
  }
}
