import 'dart:async';

import 'package:ecommerce_store/components/components.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    String route = '/';
    Timer(const Duration(seconds: 2), () => Navigator.pop(context, route));

    return Scaffold(
      body:
          Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
        Center(
          child: Image(
            image: AssetImage('assets/images/logo.png'),
            width: 125,
            height: 125,
          ),
        )
      ]),
    );

    //ProductCard(product: Product.products[0]),
  }
}
