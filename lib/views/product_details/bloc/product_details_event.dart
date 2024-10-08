part of 'product_details_bloc.dart';

abstract class ProductDetailsEvent extends Equatable {
  const ProductDetailsEvent();
  @override
  List<Object> get props => [];
}

class ToggleFavEvent extends ProductDetailsEvent {
  final String productId;
  const ToggleFavEvent({required this.productId});
  @override
  List<Object> get props => [productId];
}
