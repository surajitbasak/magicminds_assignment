part of 'product_bloc.dart';

class ProductState extends Equatable {
  const ProductState({required this.products, this.limit = 5, this.loadMore = false, this.fullProducts = const []});

  final int limit;
  final ApiResponse<List<ProductModel>> products;
  final List<ProductModel> fullProducts;
  final bool loadMore;

  @override
  List<Object?> get props => [products, limit, loadMore, fullProducts];

  ProductState copyWith({
    int? limit,
    ApiResponse<List<ProductModel>>? products,
    List<ProductModel>? fullProducts,
    bool? loadMore,
  }) {
    return ProductState(
      limit: limit ?? this.limit,
      products: products ?? this.products,
      fullProducts: fullProducts ?? this.fullProducts,
      loadMore: loadMore ?? this.loadMore,
    );
  }
}
