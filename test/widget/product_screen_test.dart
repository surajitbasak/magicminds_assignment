// test/widget_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:magicminds_assignment/configs/components/my_appbar.dart';
import 'package:magicminds_assignment/repository/product_api/product_repository.dart';
import 'package:magicminds_assignment/services/storage/local_storage.dart';
import 'package:magicminds_assignment/utils/widget_test_helper.dart';
import 'package:magicminds_assignment/views/product/product_screen.dart';
import 'package:magicminds_assignment/views/product/widgets/my_search_bar.dart';

GetIt getIt = GetIt.instance;
void main() {
  // test/widget_test.dart
  group('ProductScreen', () {
    servicesLocator();
    testWidgets('renders MyAppBar', (tester) async {
      await tester.pumpWidget(
        const WidgetTestHelper(child: ProductScreen()),
      );
      expect(find.byType(MyAppBar), findsOneWidget);
    });

    testWidgets('renders MySearchBar', (tester) async {
      await tester.pumpWidget(
        const WidgetTestHelper(child: ProductScreen()),
      );
      expect(find.byType(MySearchBar), findsOneWidget);
    });
  });
}

void servicesLocator() {
  getIt.registerLazySingleton<ProductApiRepository>(() => ProductHttpApiRepository()); // Registering ProductHttpApiRepository as a lazy singleton for ProductApiRepository
  getIt.registerLazySingleton<LocalStorage>(() => LocalStorage()); // Registering Local storage for local storage.
}