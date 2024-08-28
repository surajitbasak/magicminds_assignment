part of 'product_bloc.dart';

class ProductState extends Equatable {
  const ProductState({required this.products, this.limit = 5, this.loadMore = false});

  final int limit;
  final ApiResponse<List<ProductModel>> products;
  final bool loadMore;

  @override
  List<Object?> get props => [products, limit, loadMore];

  ProductState copyWith({
    int? limit,
    ApiResponse<List<ProductModel>>? products,
    bool? loadMore,
  }) {
    return ProductState(
      limit: limit ?? this.limit,
      products: products ?? this.products,
      loadMore: loadMore ?? this.loadMore,
    );
  }
}
