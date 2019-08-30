import 'package:customer_app/src/res/colors.dart';
import 'package:customer_app/src/res/dimens.dart';
import 'package:customer_app/src/res/localization.dart';
import 'package:customer_app/src/res/styles.dart';
import 'package:customer_app/src/ui/widgets/raised_rect_button.dart';
import 'package:customer_app/src/utils/validator.dart';
import 'package:flutter/material.dart';

import 'flat_rect_button.dart';

class AppAlertDialog extends StatefulWidget {
  final String message;
  final Function() onOKTap;

  AppAlertDialog(this.message, this.onOKTap);

  @override
  _AppAlertDialogState createState() => _AppAlertDialogState(message, onOKTap);
}

class _AppAlertDialogState extends State<AppAlertDialog> with Validator {
  final String message;
  final Function() onOKTap;
  AppLocalizations strings;

  _AppAlertDialogState(this.message, this.onOKTap);

  @override
  Widget build(BuildContext context) {
    strings = AppLocalizations.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.radius_4dp),
      ),
      elevation: 0.0,
      backgroundColor: AppColors.transparent,
      child: buildDialogContent(context),
    );
  }

  Widget buildDialogContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.padding_8dp),
      margin: EdgeInsets.only(top: Dimens.margin_8dp),
      decoration: BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(Dimens.radius_4dp),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: Dimens.radius_8dp,
            offset: const Offset(0.0, 8.0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          //SizedBox(height: Dimens.margin_8dp),
          Image.asset('assets/images/serve.png', height: 50),
          SizedBox(height: Dimens.margin_8dp),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Styles.body1TextStyle
                .copyWith(color: AppColors.black, fontSize: Dimens.font_16sp),
          ),

          SizedBox(height: Dimens.margin_16dp),
          //buildSaveButton(context),
          buildCancelButton(context),
          //SizedBox(height: Dimens.margin_8dp),
        ],
      ),
    );
  }

  Widget buildSaveButton(BuildContext context) {
    return RaisedRectButton(
      text: 'Save',
      textColor: AppColors.white,
      onPressed: () {},
      //backgroundColor: AppColors.white,
      //borderColor: AppColors.lightGrey,
    );
  }

  Widget buildCancelButton(BuildContext context) {
    return FlatRectButton(
      text: 'OK',
      textColor: AppColors.black,
      /*onPressed: () {
        //AppNavigator.popBackStack(context);
      },*/
      onPressed: onOKTap,
      backgroundColor: AppColors.white,
      borderColor: AppColors.lightGrey,
    );
  }
}
