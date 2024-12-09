import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:magicminds_assignment/models/product/product_model.dart';
import 'package:magicminds_assignment/repository/product_api/product_repository.dart';
import 'package:magicminds_assignment/services/storage/local_storage.dart';

GetIt getIt = GetIt.instance;
void main() {
  late ProductMockApiRepository repo;
  late LocalStorage storage;
  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    FlutterSecureStorage.setMockInitialValues({});
  });
  group('ProducScreen Unit Test', () {
    servicesLocator();
    test('Product Fetch Api Test', () async {
      repo = getIt();
      var result = await repo.productApi(10);
      expect(result, isA<List<ProductModel>>());
    });
    test('Saved Product Fetch Test', () async {
      storage = getIt();
      var result = await storage.readValue('Random');
      expect(result, isA<bool>());
    });
  });
}

void servicesLocator() {
  getIt.registerLazySingleton<ProductMockApiRepository>(
      () => ProductMockApiRepository()); // Registering ProductMockApiRepository as a lazy singleton for ProductApiRepository
  getIt.registerLazySingleton<LocalStorage>(() => LocalStorage()); // Registering Local storage for local storage.
}
