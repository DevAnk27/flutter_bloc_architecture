import 'package:flutter/material.dart';

import 'colors.dart';
import 'dimens.dart';

class Styles {
  static final ThemeData AppTheme = new ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.colorPrimary,
    primaryColorDark: AppColors.colorPrimary,
    primaryColorBrightness: Brightness.light,
    accentColor: AppColors.colorAccent,
    accentColorBrightness: Brightness.light,
    textTheme: textTheme,
    backgroundColor: AppColors.appBackground,
  );

  static final textTheme = TextTheme(
    headline: headlineTextStyle,
    title: titleTextStyle,
    body1: body1TextStyle,
  );

  static final ThemeData disableTextFieldTheme = ThemeData(
      disabledColor: AppColors.labelGrey,
      inputDecorationTheme: InputDecorationTheme(
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: AppColors.labelGrey,
          width: 1,
        )),
      ));

  static final baseTextStyle = const TextStyle(color: AppColors.white);

  static final headlineTextStyle = baseTextStyle.copyWith(
      fontSize: Dimens.font_18sp, fontWeight: FontWeight.bold);

  static final headlineTextStyle2 = baseTextStyle.copyWith(
      fontSize: Dimens.font_18sp, fontWeight: FontWeight.bold, color: AppColors.black);

  static final titleTextStyle = baseTextStyle.copyWith(
      fontSize: Dimens.font_16sp, fontWeight: FontWeight.bold);

  static final subTitleTextStyle = baseTextStyle.copyWith(
      fontSize: Dimens.font_14sp, fontWeight: FontWeight.bold, color: AppColors.labelGrey);

  static final blackTitleTextStyle =
      const TextStyle(color: AppColors.black, fontSize: Dimens.font_16sp);

  static final orangeTitleTextStyle = const TextStyle(
      color: AppColors.colorPrimary, fontSize: Dimens.font_16sp);

  static final body1TextStyle = baseTextStyle.copyWith(
      fontSize: Dimens.font_14sp, color: AppColors.black);

  static final body1LabelGreyTextStyle = body1TextStyle.copyWith(
      fontSize: Dimens.font_14sp, color: AppColors.labelGrey);

  static final body2TextStyle = baseTextStyle.copyWith(
      fontSize: Dimens.font_12sp, color: AppColors.black);

  static final body2LightGreyTextStyle =
      body2TextStyle.copyWith(color: AppColors.lightGrey);

  static final body2SkyBlueTextStyle =
  body2TextStyle.copyWith(color: AppColors.skyBlue);

  static final body2BlueTextStyle =
  body2TextStyle.copyWith(color: AppColors.blue);

  static final hintTextStyle =
      const TextStyle(color: AppColors.grey400, fontSize: Dimens.font_12sp);

  static final textFieldStyle =
      const TextStyle(color: AppColors.black, fontSize: Dimens.font_14sp);
}
