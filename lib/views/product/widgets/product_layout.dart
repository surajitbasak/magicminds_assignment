import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magicminds_assignment/configs/color/color.dart';
import 'package:magicminds_assignment/configs/routes/routes_name.dart';
import 'package:magicminds_assignment/main.dart';
import 'package:magicminds_assignment/models/product/product_model.dart';
import 'package:magicminds_assignment/services/storage/local_storage.dart';
import 'package:sizer/sizer.dart';

class ProductLayout extends StatelessWidget {
  const ProductLayout({super.key, required this.item});
  final ProductModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var isFav = await getIt<LocalStorage>().readValue(item.id.toString());
        if (context.mounted) Navigator.pushNamed(context, RoutesName.productDetails, arguments: {'productItem': item, 'isFav': isFav});
      },
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey.shade300), right: BorderSide(color: Colors.grey.shade300)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: 2.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(10), // Image border
                child: SizedBox(
                  height: 15.h, // Image radius
                  child: Hero(
                    tag: 'product_image${item.id}',
                    child: CachedNetworkImage(
                      imageUrl: item.image,
                      placeholder: (context, url) => Image.asset(
                        'assets/gifs/icon_loading_pic.gif',
                        width: 10.h,
                        height: 10.h,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  item.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontFamily: GoogleFonts.aBeeZee().fontFamily, fontSize: 15.sp),
                ),
              ),
              SizedBox(height: 1.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '₹ ${item.price}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontFamily: GoogleFonts.aBeeZee().fontFamily, fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 1.h),
              Row(
                children: [
                  RatingBarIndicator(
                    rating: item.rating.rate,
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
                    item.rating.rate.toString(),
                    style: TextStyle(fontFamily: GoogleFonts.inter().fontFamily, fontSize: 15.sp),
                  ),
                  Text(
                    ' (${item.rating.count})',
                    style: TextStyle(fontFamily: GoogleFonts.inter().fontFamily, fontSize: 15.sp, color: AppColors.blueColor),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
