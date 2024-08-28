import 'package:magicminds_assignment/models/product/product_model.dart';

import 'product_api_repository.dart';

/// Mock implementation of [ProductApiRepository] for simulating login requests.
class ProductMockApiRepository implements ProductApiRepository {
  @override
  Future<ProductModel> productApi(dynamic data) async {
    // Simulate a delay to mimic network latency
    await Future.delayed(const Duration(seconds: 2));
    // Mock response data
    var responseData = {'token': 'a23z345xert'};
    return ProductModel.fromJson(responseData);
  }
}
