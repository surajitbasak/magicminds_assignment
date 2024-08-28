import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  factory ProductModel({
    @Default(0) int id,
    @Default('N/A') String title,
    @Default(0.0) double price,
    @Default('N/A') String description,
    @Default('N/A') String category,
    @Default('N/A') String image,
    required Rating rating,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}

@freezed
class Rating with _$Rating {
  factory Rating({
    @Default(0.0) double rate,
    @Default(0) int count,
  }) = _Rating;

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}
