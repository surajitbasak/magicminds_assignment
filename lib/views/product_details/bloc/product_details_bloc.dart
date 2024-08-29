import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:magicminds_assignment/services/storage/local_storage.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final LocalStorage storage;
  final bool isFav;
  ProductDetailsBloc({required this.storage, required this.isFav}) : super(ProductDetailsState(isFav: isFav)) {
    on<ToggleFavEvent>(_toggleFavEvent);
  }

  FutureOr<void> _toggleFavEvent(ToggleFavEvent event, Emitter<ProductDetailsState> emit) async{
    await storage.setValue(event.productId, !isFav);
    emit(state.copyWith(isFav: !isFav));
  }
}
