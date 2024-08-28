import 'package:magicminds_assignment/models/product/product_model.dart';


/// Abstract class defining methods for authentication API repositories.
abstract class ProductApiRepository {
  /// Sends a login request to the authentication API with the provided [data].
  ///
  /// Returns a [UserModel] representing the user data if the login is successful.
  Future<ProductModel> productApi(int limit);
}
