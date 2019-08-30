import 'package:customer_app/src/res/colors.dart';
import 'package:customer_app/src/res/dimens.dart';
import 'package:customer_app/src/res/styles.dart';
import 'package:flutter/material.dart';


class FlatRectButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final String text;
  final double width;
  final double radius;
  final Function onPressed;

  FlatRectButton({
    this.backgroundColor = AppColors.colorPrimary,
    this.textColor = AppColors.white,
    this.borderColor = AppColors.transparent,
    this.text,
    this.width = double.infinity,
    this.radius = Dimens.radius_4dp,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
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
                    padding: const EdgeInsets.symmetric(
                        vertical: Dimens.padding_8dp),
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
