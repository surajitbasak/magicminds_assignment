import 'package:flutter/material.dart';
import 'package:magicminds_assignment/views/product/product_screen.dart';
import 'package:magicminds_assignment/views/product_details/product_details_screen.dart';
import 'routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.product:
        return MaterialPageRoute(builder: (BuildContext context) => const ProductScreen());

      case RoutesName.productDetails:
        return MaterialPageRoute(builder: (BuildContext context) => const ProductDetailsScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
