part of 'product_details_bloc.dart';

class ProductDetailsState extends Equatable {

  final bool isFav;
  const ProductDetailsState({required this.isFav});
  @override
  List<Object> get props => [isFav];

  ProductDetailsState copyWith({
    bool? isFav,
  }) {
    return ProductDetailsState(
      isFav: isFav ?? this.isFav,
    );
  }
}
