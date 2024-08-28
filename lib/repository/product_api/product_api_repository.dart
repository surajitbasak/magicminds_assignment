import 'package:magicminds_assignment/models/product/product_model.dart';


/// Abstract class defining methods for authentication API repositories.
abstract class ProductApiRepository {
  /// Sends a request to the products API with the provided  [limit].
  ///
  /// Returns a List of [ProductModel] representing the product data.
  Future<List<ProductModel>> productApi(int limit);
}
