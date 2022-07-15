import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neostore/domain/usecases/cart/get_cart_items_usecase.dart';
import 'package:neostore/presentation/cart/controller/cart_list_events.dart';
import 'package:neostore/presentation/cart/controller/cart_list_states.dart';

class CartListBloc extends Bloc<CartListEvent, CartListState> {
  GetCartItemsUseCase _useCase;
  int itemCount = 0;
  CartListBloc({required GetCartItemsUseCase cartItemsUseCase})
      : _useCase = cartItemsUseCase,
        super(CartListInitState()) {
    on<FetchCartItemsEvent>((event, emit) async {
      debugPrint(event.toString());
      emit(CartListLoadingState());
      final response = await _useCase.getCartItemsList();
      response.fold((left) {
        debugPrint(left.message);
        emit(CartListFetchFailedState(failure: left));
      }, (right) {
        debugPrint(right.toString());
        if (!(right.count == null) && right.count! > 0) {
          itemCount = 2;
        }

        emit(CartListFetchSuccessfulState(cart: right));
      });
    });
  }
}