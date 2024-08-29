// test/widget_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magicminds_assignment/configs/components/my_appbar.dart';
import 'package:magicminds_assignment/views/product/product_screen.dart';
import 'package:magicminds_assignment/views/product/widgets/my_search_bar.dart';

void main() {
  group('ProductScreen', () {
    testWidgets('renders MyAppBar', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ProductScreen(),
        ),
      );
      expect(find.byType(MyAppBar), findsOneWidget);
    });

    testWidgets('renders MySearchBar', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ProductScreen(),
        ),
      );
      expect(find.byType(MySearchBar), findsOneWidget);
    });
  });
}