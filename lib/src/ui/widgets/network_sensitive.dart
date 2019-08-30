import 'package:customer_app/src/res/dimens.dart';
import 'package:customer_app/src/res/localization.dart';
import 'package:customer_app/src/res/styles.dart';
import 'package:customer_app/src/utils/connectivity_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NetworkSensitive extends StatelessWidget {
  final Widget child;
  AppLocalizations strings;

  NetworkSensitive({this.child});

  @override
  Widget build(BuildContext context) {
    strings = AppLocalizations.of(context);
    var connectionStatus = Provider.of<ConnectivityStatus>(context);
    if (connectionStatus == ConnectivityStatus.Online) {
      return child;
    } else {
      return buildNoInternetUI();
    }
  }

  Widget buildNoInternetUI() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('No Internet Connection!', style: Styles.blackTitleTextStyle),
          SizedBox(height: Dimens.margin_4dp),
          Text('Please try to connect with internet.', style: Styles.body1TextStyle)
        ],
      ),
    );
  }
}
