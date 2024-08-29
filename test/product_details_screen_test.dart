import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magicminds_assignment/configs/components/my_appbar.dart';
import 'package:magicminds_assignment/models/product/product_model.dart';
import 'package:magicminds_assignment/views/product_details/product_details_screen.dart';

void main() {
  group('ProductDetailsScreen', () {
    testWidgets('renders MyAppBar', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ProductDetailsScreen(item: ProductModel(rating: Rating()), isFav: false),
        ),
      );
      expect(find.byType(MyAppBar), findsOneWidget);
    });

    testWidgets('renders product details', (tester) async {
      final product = ProductModel(
        id: 1,
        title: 'Test Product',
        description: 'This is a test product',
        price: 10.99,
        rating: Rating()
      );
      await tester.pumpWidget(
        MaterialApp(
          home: ProductDetailsScreen(item: product, isFav: false),
        ),
      );
      expect(find.text(product.title), findsOneWidget);
      expect(find.text(product.description), findsOneWidget);
      expect(find.text('\$${product.price}'), findsOneWidget);
    });
  });
}