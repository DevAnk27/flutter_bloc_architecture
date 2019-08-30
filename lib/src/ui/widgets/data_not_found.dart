import 'package:customer_app/src/res/localization.dart';
import 'package:customer_app/src/res/styles.dart';
import 'package:flutter/material.dart';

class DataNotFound extends StatelessWidget {
  AppLocalizations strings;
  final String error;

  DataNotFound({this.error});

  @override
  Widget build(BuildContext context) {
    strings = AppLocalizations.of(context);
    return buildDataNotFoundUI();
  }

  Widget buildDataNotFoundUI() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            error == null ? 'Data Not Found' : error,
            style: Styles.blackTitleTextStyle,
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
