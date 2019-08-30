import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:customer_app/src/data/local_pref/shared_preferences_utils.dart';
import 'package:customer_app/src/data/models/employee.dart';
import 'package:customer_app/src/res/colors.dart';
import 'package:customer_app/src/res/dimens.dart';
import 'package:customer_app/src/res/localization.dart';
import 'package:customer_app/src/utils/connectivity_service.dart';
import 'package:customer_app/src/utils/constants.dart';
import 'package:customer_app/src/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = "/";

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  AppLocalizations strings;
  StreamSubscription<ConnectivityResult> _connectionSubscription;


  @override
  void initState() {
    super.initState();

  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    strings = AppLocalizations.of(context);
    var connectionStatus = Provider.of<ConnectivityStatus>(context);
    if (connectionStatus == ConnectivityStatus.Online) {
      Timer(Duration(seconds: 1), () => launchLoginOrDashboardPage());
    } else if (connectionStatus == ConnectivityStatus.Offline) {
      Helper.showSnackBar(_scaffoldKey, 'No internet connection',
          duration: Constants.SB_NO_INTERNET_DURATION);
    }
  }

  @override
  void dispose() {
    _scaffoldKey = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      body: buildSplashBG(),
    );
  }

  Widget buildSplashBG() {
    return SizedBox.expand(
      child: Image.asset(
        'assets/images/splash.png',
        fit: BoxFit.fill,
      ),
      /*child: Image.asset(
        'assets/images/delete_item.png',
        fit: BoxFit.fill,
      ),*/
    );
  }

  Widget buildLogo(context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 48.0,
              child: Icon(
                Icons.ac_unit,
                color: AppColors.colorAccent,
                size: 48.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Dimens.padding_8dp),
            ),
            Text(
              AppLocalizations.of(context).appTitle,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0),
            )
          ],
        ),
      ),
    );
  }

  void launchLoginOrDashboardPage() async {
    SPUtil spUtil = await SPUtil.getInstance();
    Employee employee = spUtil.getEmployee(SPKeys.EMPLOYEE);



  }
}
