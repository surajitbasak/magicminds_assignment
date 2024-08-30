import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:magicminds_assignment/configs/components/my_appbar.dart';
import 'package:magicminds_assignment/models/product/product_model.dart';
import 'package:magicminds_assignment/repository/product_api/product_repository.dart';
import 'package:magicminds_assignment/services/storage/local_storage.dart';
import 'package:magicminds_assignment/utils/widget_test_helper.dart';
import 'package:magicminds_assignment/views/product_details/product_details_screen.dart';

GetIt getIt = GetIt.instance;
void main() {
  group('ProductDetailsScreen', () {
    servicesLocator();
    testWidgets('renders MyAppBar', (tester) async {
      await tester.pumpWidget(
        WidgetTestHelper(
          child: ProductDetailsScreen(item: ProductModel(rating: Rating()), isFav: false),
        ),
      );
      expect(find.byType(MyAppBar), findsOneWidget);
    });

    testWidgets('renders product details', (tester) async {
      final product = ProductModel(id: 1, title: 'Test Product', description: 'This is a test product', price: 10.99, rating: Rating());
      await tester.pumpWidget(
        WidgetTestHelper(
          child: ProductDetailsScreen(item: product, isFav: false),
        ),
      );
      expect(find.text(product.title), findsOneWidget);
      expect(find.text(product.description), findsOneWidget);
      expect(find.text('₹ ${product.price}'), findsOneWidget);
    });
  });
}

void servicesLocator() {
  getIt.registerLazySingleton<ProductApiRepository>(() => ProductHttpApiRepository()); // Registering ProductHttpApiRepository as a lazy singleton for ProductApiRepository
  getIt.registerLazySingleton<LocalStorage>(() => LocalStorage()); // Registering Local storage for local storage.
}
