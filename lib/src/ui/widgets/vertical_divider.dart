import 'package:customer_app/src/res/colors.dart';
import 'package:customer_app/src/res/dimens.dart';
import 'package:flutter/material.dart';

class VDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      color: AppColors.grey400,
      width: Dimens.divider_height_1dp,
    );
  }
}
