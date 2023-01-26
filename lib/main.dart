import 'package:ecommerce_store/blocs/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_store/components/components.dart';
import 'package:ecommerce_store/screens/screens.dart';
import 'package:flutter/material.dart';
import 'blocs/wishlist/wishlist_bloc.dart';
import 'config/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => WishlistBloc()..add(LoadWishlist())),
          BlocProvider(
            create: (_) => CartBloc()..add(LoadCart()),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'TechGoodies',
          //theme: theme(),
          home: HomeScreen(),

          theme: theme(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: HomeScreen.routeName,
        ));
  }
}
