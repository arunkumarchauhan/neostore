import 'package:equatable/equatable.dart';
import 'package:neostore/core/orders/domain/entity/order_detail_metadata_entity.dart';
import 'package:neostore/utils/models/failure.dart';

abstract class OrderDetailState extends Equatable {}

class OrderDetailInitState extends OrderDetailState {
  @override
  List<Object?> get props => [];
}

class OrderDetailLoadingState extends OrderDetailState {
  @override
  List<Object?> get props => [];
  @override
  String toString() {
    return "OrderDetailLoadingState";
  }
}

class OrderDetailFetchSuccessState extends OrderDetailState {
  final OrderDetailMetaDataEntity order;
  OrderDetailFetchSuccessState({required this.order});
  @override
  List<Object?> get props => [order];
  @override
  String toString() {
    return "OrderDetailFetchSuccessState : Orders Items Length : ${order.orderDetails?.length} ";
  }
}

class OrderDetailFetchFailedState extends OrderDetailState {
  final Failure failure;
  OrderDetailFetchFailedState({required this.failure});
  @override
  List<Object?> get props => [failure];
  @override
  String toString() {
    return "OrderDetailFetchFailedState : Message : ${failure.message}";
  }
}
