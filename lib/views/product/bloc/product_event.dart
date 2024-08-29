part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class GetProductsEvent extends ProductEvent {
  const GetProductsEvent({required this.limit});

  final int limit;

  @override
  List<Object?> get props => [limit];
}

class GetMoreProductsEvent extends ProductEvent {
  const GetMoreProductsEvent({required this.limit});

  final int limit;

  @override
  List<Object?> get props => [limit];
}

class SearchProductEvent extends ProductEvent {
  const SearchProductEvent({required this.query});

  final String query;
  @override
  List<Object?> get props => [];
}
