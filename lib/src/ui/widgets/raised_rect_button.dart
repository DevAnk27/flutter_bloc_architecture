import 'package:customer_app/src/res/colors.dart';
import 'package:customer_app/src/res/dimens.dart';
import 'package:customer_app/src/res/styles.dart';
import 'package:flutter/material.dart';

class RaisedRectButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final String text;
  final double width;
  final double radius;
  final double textTBPadding;
  final Function onPressed;

  RaisedRectButton({
    this.backgroundColor = AppColors.colorPrimary,
    this.textColor = AppColors.white,
    this.borderColor = AppColors.transparent,
    this.text,
    this.width = double.infinity,
    this.radius = Dimens.radius_4dp,
    this.textTBPadding = Dimens.padding_8dp,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              /*shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(radius),
              ),*/
              shape: RoundedRectangleBorder(
                side: BorderSide(color: borderColor),
                borderRadius: BorderRadius.circular(radius),
              ),
              splashColor: this.backgroundColor,
              color: this.backgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: textTBPadding,
                    ),
                    child: Text(
                      text,
                      style: Styles.body1TextStyle.copyWith(color: textColor),
                    ),
                  ),
                ],
              ),
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
