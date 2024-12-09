import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicminds_assignment/configs/components/my_appbar.dart';
import 'package:magicminds_assignment/configs/localization/localization_config.dart';
import 'package:magicminds_assignment/main.dart';
import 'package:magicminds_assignment/views/product/widgets/my_search_bar.dart';
import 'package:magicminds_assignment/views/product/widgets/product_layout.dart';
import 'package:sizer/sizer.dart';

import '../../utils/enums.dart';
import 'bloc/product_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late ProductBloc _productBloc;
  final _controller = ScrollController();
  @override
  void initState() {
    super.initState();
    _productBloc = ProductBloc(productApiRepository: getIt());
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        bool isTop = _controller.position.pixels == 0;
        if (isTop) {
          log('At the top');
        } else {
          log('At the bottom');
          _productBloc.add(const GetMoreProductsEvent(limit: 10));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyAppBar(title: localization.products),
          MySearchBar(
            onSearch: (query) => _productBloc.add(SearchProductEvent(query: query)),
          ),
          Expanded(
            child: BlocBuilder<ProductBloc, ProductState>(
              bloc: _productBloc..add(const GetProductsEvent(limit: 10)),
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
                  return Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          controller: _controller,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.75),
                          itemCount: state.products.data!.length,
                          itemBuilder: (context, index) => ProductLayout(item: state.products.data![index]),
                        ),
                      ),
                      Visibility(
                        visible: state.loadMore,
                        child: Padding(
                          padding: EdgeInsets.all(1.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 2.h,
                                width: 2.h,
                                child: const CircularProgressIndicator(
                                  strokeWidth: 1,
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(localization.loading),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                }
                return Center(
                  child: Text(localization.productScreen),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
