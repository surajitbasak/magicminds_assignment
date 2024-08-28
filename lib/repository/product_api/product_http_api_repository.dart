import 'package:magicminds_assignment/models/product/product_model.dart';

import '../../data/network/base_api_services.dart';
import '../../data/network/network_api_services.dart';
import '../../utils/app_url.dart';
import '../../utils/custom_functions.dart';
import 'product_api_repository.dart';

/// Implementation of [ProductApiRepository] for making HTTP requests to the products API.
class ProductHttpApiRepository implements ProductApiRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  /// Sends a request to the products API with the provided [limit].
  ///
  /// Returns a list of [ProductModel] representing the product data.
  @override
  Future<List<ProductModel>> productApi(int limit) async {
    dynamic response = await _apiServices.getApi('${AppUrl.products}?limit=$limit');
    return parseJsonList<ProductModel>(response, ProductModel.fromJson);
  }
}
