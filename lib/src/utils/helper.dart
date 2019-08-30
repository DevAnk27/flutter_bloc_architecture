import 'package:customer_app/src/res/colors.dart';
import 'package:customer_app/src/res/dimens.dart';
import 'package:customer_app/src/res/styles.dart';
import 'package:customer_app/src/ui/widgets/app_alert_dialog.dart';
import 'package:customer_app/src/ui/widgets/app_progress_dialog.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:intl/intl.dart';

enum ConfirmAction { CANCEL, OK }

class Helper {
  //static ProgressDialog pr;
  static AppProgressDialog pr;

  static double getToolbarStatusBarHeightWithMarginTop(BuildContext context) {
    return MediaQuery.of(context).padding.top +
        Dimens.toolbar_height +
        Dimens.margin_8dp;
  }

  static double getToolbarStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top + Dimens.toolbar_height + 1;
  }

  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static showProgressDialog(BuildContext context, String message) {
    /*pr = ProgressDialog(context, ProgressDialogType.Normal);
    pr.setMessage(message);
    pr.show();*/

    if(pr != null && pr.isShowing()) {
      pr.update(message: message);
    } else {
      pr = AppProgressDialog(context, ProgressDialogType.Normal);
      pr.setMessage(message);
      pr.show();
    }
  }

  static hideProgressDialog() {
    if (pr != null && pr.isShowing()) {
      pr.hide();
    }
  }

  static void showAlertDialog(BuildContext context, String heading,
      {String body, String textOKBtn = 'OK'}) {
    if (body == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              heading,
              style: Styles.titleTextStyle.copyWith(color: AppColors.black),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(textOKBtn),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              heading,
              style: Styles.titleTextStyle.copyWith(color: AppColors.black),
            ),
            content: Text(
              body,
              style: Styles.body1TextStyle.copyWith(color: AppColors.black),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(textOKBtn),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  static void showAlertDialogWithOnTap(
      BuildContext context, String heading, Function onTap,
      {String textOKBtn = 'OK'}) {
    /*showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            heading,
            style: Styles.body1TextStyle.copyWith(color: AppColors.black),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(textOKBtn),
              onPressed: onTap,
            ),
          ],
        );
      },
    );*/

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) =>
          AppAlertDialog(heading, onTap),
    );
  }

  static Future<ConfirmAction> asyncConfirmDialog(
      BuildContext context, String heading, String body,
      {String textOKBtn = 'Ok', String textCancelBtn = 'CANCEL'}) async {
    return showDialog<ConfirmAction>(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(heading),
          content: Text(body),
          actions: <Widget>[
            FlatButton(
              child: Text(textCancelBtn),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.CANCEL);
              },
            ),
            FlatButton(
              child: Text(textOKBtn),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.OK);
              },
            )
          ],
        );
      },
    );
  }

  static void showSnackBar(
      final GlobalKey<ScaffoldState> _scaffoldKey, String message,
      {int duration = 3}) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: duration),
    ));
  }

  static void showSnackBarWithAction(
    final GlobalKey<ScaffoldState> _scaffoldKey,
    String message,
    String actionLabel,
    Function onTap, {
    int duration = 3,
  }) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: duration),
      action: SnackBarAction(label: actionLabel, onPressed: onTap),
    ));
  }

  static String minutesToHHmm(int minutes) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    var hhmm = '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
    if (hhmm.contains("-")) {
      hhmm = hhmm.substring(1);
    }
    return hhmm;
  }

  static String generateServiceCode(String lastServiceCode) {
    String newServiceCode = '';
    if (lastServiceCode != null && lastServiceCode.isNotEmpty) {
      String numString;
      String charString;
      for (int i = 1; i <= lastServiceCode.length; i++) {
        var numSubString =
            lastServiceCode.substring(lastServiceCode.length - i);
        if (isNumeric(numSubString)) {
          numString = numSubString;
        } else {
          charString =
              lastServiceCode.substring(0, lastServiceCode.length - i + 1);
          break;
        }
      }

      if (numString != null && numString.isNotEmpty) {
        var number = int.parse(numString) + 1;
        newServiceCode = '$charString$number';
        if (newServiceCode.length == 2) {
          newServiceCode = '${charString}00$number';
        } else if (newServiceCode.length == 3) {
          newServiceCode = '${charString}0$number';
        }
      } else {
        newServiceCode = '${charString}1';
      }
    } else {
      newServiceCode = Constants.DEFAULT_SERVICE_CODE;
    }
    return newServiceCode;
  }

  static String generateProductCode(String lastProductCode) {
    String newProductCode = '';
    if (lastProductCode != null && lastProductCode.isNotEmpty) {
      String numString;
      String charString;
      for (int i = 1; i <= lastProductCode.length; i++) {
        var numSubString =
        lastProductCode.substring(lastProductCode.length - i);
        if (isNumeric(numSubString)) {
          numString = numSubString;
        } else {
          charString =
              lastProductCode.substring(0, lastProductCode.length - i + 1);
          break;
        }
      }

      if (numString != null && numString.isNotEmpty) {
        var number = int.parse(numString) + 1;
        newProductCode = '$charString$number';
        if (newProductCode.length == 2) {
          newProductCode = '${charString}00$number';
        } else if (newProductCode.length == 3) {
          newProductCode = '${charString}0$number';
        }
      } else {
        newProductCode = '${charString}1';
      }
    } else {
      newProductCode = Constants.DEFAULT_PRODUCT_CODE;
    }
    return newProductCode;
  }

  static bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    try {
      var num = double.parse(s);
      return true;
    } catch (e) {
      return false;
    }
    //return double.parse(s, (e) => null) != null;
  }

  static String getFirstDayOfMonth() {
    String strDate;
    try {
      var now = DateTime.now();
      var firstDate = DateTime(now.year, now.month, 1, now.hour, now.minute, now.second, now.millisecond, now.microsecond);
      strDate = DateFormat("yyyy-MM-ddTHH:mm:ss").format(firstDate);
    } catch (e) {
      print(e.toString());
    }
    return strDate;
  }

  static String getLastDateOfMonth() {
    String strDate;
    try {
      var now = DateTime.now();
      // Find the last day of the month.
      var lastDayDateTime = (now.month < 12) ? new DateTime(now.year, now.month + 1, 0) : new DateTime(now.year + 1, 1, 0);
      strDate = DateFormat("yyyy-MM-ddTHH:mm:ss").format(lastDayDateTime);
    } catch (e) {
      print(e.toString());
    }
    return strDate;
  }

  static String roundDecimalValue(String value) {
    print('before.........$value');
    var doubleValue = double.parse(value);
    var roundValue = doubleValue.toStringAsFixed(2);
    print('after.........$roundValue');
    //return double.parse(roundValue);
    return roundValue;
  }
}
