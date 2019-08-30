import 'package:customer_app/src/res/colors.dart';
import 'package:customer_app/src/res/dimens.dart';
import 'package:flutter/material.dart';

class HDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.grey400,
      height: Dimens.divider_height_1dp,
    );
  }
}
