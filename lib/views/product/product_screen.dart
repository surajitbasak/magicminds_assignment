import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicminds_assignment/main.dart';

import '../../utils/enums.dart';
import 'bloc/product_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late ProductBloc _productBloc;

  @override
  void initState() {
    super.initState();
    _productBloc = ProductBloc(productApiRepository: getIt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(
        bloc: _productBloc..add(const GetProductsEvent(limit: 5)),
        builder: (context, state) {
          if (state.products.status == Status.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.products.status == Status.error) {
            return Center(
              child: Text(state.products.message!),
            );
          } 

          if (state.products.status == Status.completed) {
            return ListView.builder(
              itemCount: state.products.data!.length,
              itemBuilder: (context, index) {
                return Container(margin: const EdgeInsets.all(10),child: Text(state.products.data![index].title));
              },
            );
          }
          return const Center(
            child: Text('Product Screen'),
          );
        },
      ),
    );
  }
}
