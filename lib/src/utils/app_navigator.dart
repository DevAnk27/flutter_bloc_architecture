import 'package:customer_app/src/data/models/employee.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  static void launchOBSignInSignUpPage(BuildContext context) {
    //Navigator.pushReplacementNamed(context, OBSignInSignUpPage.routeName);
  }

  static void launchOBSignUpPage(BuildContext context) {
    //Navigator.pushNamed(context, OBSignUpPage.routeName);
  }


  static void launchEmployeeAvatarPage(BuildContext context) {
   // Navigator.pushReplacementNamed(context, EmployeeAvatarPage.routeName);
  }

  static void launchLoginPage(BuildContext context, Employee employee) {
    //Navigator.pushNamed(context, LoginPage.routeName, arguments: employee);
  }

  /*static void launchForgotPasswordPage(BuildContext context,
      {Employee employee}) {
    Navigator.pushNamed(context, ForgotPasswordPage.routeName,
        arguments: employee);
  }*/

  static void launchDashboardPage(BuildContext context, {int pageIndex = 0}) {
//    Navigator.pushNamedAndRemoveUntil(
//        context, DashboardPage.routeName, (Route<dynamic> route) => false,
//        arguments: pageIndex);
  }

  static void popBackStack(BuildContext context) {
    Navigator.pop(context);
  }
}
