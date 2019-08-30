import 'package:customer_app/src/res/styles.dart';
import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  final String error;

  Error(this.error);

  @override
  Widget build(BuildContext context) {
    return buildErrorUI();
  }

  Widget buildErrorUI() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(error, style: Styles.blackTitleTextStyle),
        ],
      ),
    );
  }
}
