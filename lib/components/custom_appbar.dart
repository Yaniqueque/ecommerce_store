import 'package:flutter/material.dart';
import 'package:ecommerce_store/components/components.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(color: Colors.white),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'wishlist');
            },
            icon: const Icon(Icons.favorite)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
