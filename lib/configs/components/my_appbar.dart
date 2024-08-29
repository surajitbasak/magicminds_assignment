import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magicminds_assignment/configs/color/color.dart';
import 'package:sizer/sizer.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key, required this.title, this.hasBack = false});
  final String title;
  final bool hasBack;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).padding.top + MediaQuery.of(context).padding.bottom + 6.h,
      decoration: const BoxDecoration(
        color: AppColors.yellowColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.greyColor,
            blurRadius: 4,
            spreadRadius: 1,
          )
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            if (hasBack) SizedBox(width: 2.w),
            if (hasBack) IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back)),
            SizedBox(width: 2.w),
            Image.asset('assets/icons/icon_product.png'),
            SizedBox(width: 2.w),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 18.sp,
                      fontFamily: GoogleFonts.inter().fontFamily,
                    ),
              ),
            ),
            const Expanded(child: SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}
