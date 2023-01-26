import 'package:ecommerce_store/blocs/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_store/components/components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/models.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = 'cart';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => CartScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: kIsWeb ? 400.0 : double.infinity,
          child: (Scaffold(
            appBar: const CustomAppBar(
              title: 'Cart',
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
                          icon: const Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                onPrimary: Colors.white),
                            onPressed: () {},
                            child: Text(
                              'GO TO CHECKOUT',
                              style: Theme.of(context).textTheme.headline3,
                            ))
                      ]),
                )),
            body: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is CartLoaded) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.cart.freeDeliveryString,
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/');
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: const RoundedRectangleBorder(),
                                        elevation: 0),
                                    child: Text(
                                      'Add More Items',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(color: Colors.white),
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 400,
                              child: ListView.builder(
                                  itemCount: state.cart.products.length,
                                  itemBuilder: (context, index) {
                                    return CartProductCard(
                                        product: state.cart.products[index]);
                                  }),
                            ),
                            // CartProductCard(
                            //   product: Product.products[0],
                            // ),
                          ],
                        ),
                        Column(
                          children: [
                            const Divider(
                              thickness: 2,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'SUBTOTAL',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                      Text(
                                        state.cart.subtotalString,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'DELIVERY FEE',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                      Text(
                                        state.cart.deliveryFeeString,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Stack(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withAlpha(50)),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  margin: const EdgeInsets.all(5.0),
                                  decoration:
                                      const BoxDecoration(color: Colors.black),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'TOTAL',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(color: Colors.white),
                                        ),
                                        Text(
                                          const Cart().totalString,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                color: Colors.white,
                                              ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return Text('Something went wroing');
                }
              },
            ),
          ))),
    );
  }
}
