import 'package:customer_app/src/res/colors.dart';
import 'package:customer_app/src/res/dimens.dart';
import 'package:customer_app/src/res/localization.dart';
import 'package:customer_app/src/res/styles.dart';
import 'package:flutter/material.dart';


class AppCircularProgressIndicator extends StatelessWidget {
  AppLocalizations strings;

  @override
  Widget build(BuildContext context) {
    strings = AppLocalizations.of(context);
    return buildUI();
  }

  Widget buildUI() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.colorPrimary),
            backgroundColor: AppColors.colorAccent,
          ),
          SizedBox(height: Dimens.margin_8dp),
          Text('Loading', style: Styles.body1TextStyle)
        ],
      ),
    );
  }
}
