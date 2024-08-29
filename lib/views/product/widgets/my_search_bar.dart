import 'package:flutter/material.dart';
import 'package:magicminds_assignment/configs/color/color.dart';
import 'package:sizer/sizer.dart';

import '../../../configs/localization/localization_config.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key, required this.onSearch});

  final Function(String query) onSearch;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [BoxShadow(color: AppColors.greyColor, blurRadius: 2, spreadRadius: 0.5)],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 3.w,
        ),
        child: Row(
          children: [
            const Icon(Icons.search),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                onChanged: onSearch,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: localization.search,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
