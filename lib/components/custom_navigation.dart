import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_store/components/components.dart';

class CustomNavigation extends StatelessWidget {
  const CustomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kIsWeb ? 400.0 : double.infinity,
      child: (BottomAppBar(
        color: primaryColor,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.home, color: bodyTextColor),
                onPressed: (() {
                  Navigator.pushNamed(context, '/');
                }),
              ),
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart,
                  color: bodyTextColor,
                ),
                onPressed: (() {
                  Navigator.pushNamed(context, 'cart');
                }),
              ),
              IconButton(
                icon: const Icon(
                  Icons.person,
                  color: bodyTextColor,
                ),
                onPressed: (() {
                  Navigator.pushNamed(context, '/user');
                }),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

// @override
// Size get preferredSize => const Size.fromHeight(50.0);
