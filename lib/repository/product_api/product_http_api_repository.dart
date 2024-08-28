import 'package:magicminds_assignment/models/product/product_model.dart';

import '../../data/network/base_api_services.dart';
import '../../data/network/network_api_services.dart';
import '../../utils/app_url.dart';
import 'product_api_repository.dart';

/// Implementation of [ProductApiRepository] for making HTTP requests to the authentication API.
class ProductHttpApiRepository implements ProductApiRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  /// Sends a login request to the authentication API with the provided [data].
  ///
  /// Returns a [UserModel] representing the user data if the login is successful.
  @override
  Future<ProductModel> productApi(int limit) async {
    dynamic response = await _apiServices.getApi('${AppUrl.products}?limit=$limit');
    return ProductModel.fromJson(response);
  }
}
