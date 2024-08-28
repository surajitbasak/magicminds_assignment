import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:magicminds_assignment/data/response/api_response.dart';
import 'package:magicminds_assignment/models/product/product_model.dart';
import 'package:magicminds_assignment/repository/product_api/auth_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductApiRepository productApiRepository;
  ProductBloc({required this.productApiRepository}) : super(ProductState(products: ApiResponse.loading())) {
    on<GetProductsEvent>(_getProducts);
    on<GetMoreProductsEvent>(_getMoreProducts);
  }

  FutureOr<void> _getProducts(GetProductsEvent event, Emitter<ProductState> emit)async {
    await productApiRepository
        .productApi(event.limit)
        .then((value) => emit(ProductState(products: ApiResponse.completed(value))))
        .onError((error, stackTrace) => emit(ProductState(products: ApiResponse.error(error.toString()))));
  }

  FutureOr<void> _getMoreProducts(GetMoreProductsEvent event, Emitter<ProductState> emit)async {
    emit(state.copyWith(loadMore: true));
    await productApiRepository
        .productApi(state.limit + event.limit)
        .then((value) => emit(state.copyWith(products: ApiResponse.completed(value), loadMore: false)))
        .onError((error, stackTrace) => emit(ProductState(products: ApiResponse.error(error.toString()), loadMore: false)));
  }
}
