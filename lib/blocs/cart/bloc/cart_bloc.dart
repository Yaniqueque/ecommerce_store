import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/models.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
