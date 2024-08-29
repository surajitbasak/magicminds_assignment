import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magicminds_assignment/main.dart';
import 'package:magicminds_assignment/models/product/product_model.dart';
import 'package:magicminds_assignment/views/product_details/bloc/product_details_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../configs/color/color.dart';
import '../../configs/components/my_appbar.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.item, required this.isFav});
  final ProductModel item;
  final bool isFav;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late ProductDetailsBloc _productDetailsBloc;

  @override
  void initState() {
    super.initState();
    _productDetailsBloc = ProductDetailsBloc(storage: getIt(), isFav: widget.isFav);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        bloc: _productDetailsBloc,
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const MyAppBar(title: 'Details', hasBack: true),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    SizedBox(width: 2.h),
                    Image.asset(
                      'assets/icons/icon_category.png',
                      height: 3.h,
                    ),
                    SizedBox(width: 1.h),
                    Text(
                      widget.item.category,
                      style: TextStyle(fontSize: 16.sp, fontFamily: GoogleFonts.inter().fontFamily),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: 2.75,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.green,
                          ),
                          itemCount: 5,
                          itemSize: 18.sp,
                          direction: Axis.horizontal,
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          widget.item.rating.rate.toString(),
                          style: TextStyle(fontFamily: GoogleFonts.inter().fontFamily, fontSize: 15.sp),
                        ),
                        Text(
                          ' (${widget.item.rating.count})',
                          style: TextStyle(fontFamily: GoogleFonts.inter().fontFamily, fontSize: 15.sp, color: AppColors.blueColor),
                        )
                      ],
                    ),
                    SizedBox(width: 2.h),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(5.w),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        width: 100.w,
                        child: Hero(
                          tag: 'product_image${widget.item.id}',
                          child: CachedNetworkImage(
                            imageUrl: widget.item.image,
                            height: 30.h,
                            placeholder: (context, url) => Image.asset(
                              'assets/gifs/icon_loading_pic.gif',
                              width: 10.h,
                              height: 10.h,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: -2.h,
                        child: IconButton(
                          onPressed: () {
                            _productDetailsBloc.add(ToggleFavEvent(productId: widget.item.id.toString()));
                          },
                          icon: Icon(
                            state.isFav ? Icons.favorite : Icons.favorite_border,
                            color: state.isFav ? AppColors.redColor : AppColors.greyColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 3.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.item.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontFamily: GoogleFonts.aBeeZee().fontFamily, fontSize: 16.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '₹ ${widget.item.price}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontFamily: GoogleFonts.aBeeZee().fontFamily, fontSize: 18.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.item.description,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontFamily: GoogleFonts.inter().fontFamily, fontSize: 16.sp),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
