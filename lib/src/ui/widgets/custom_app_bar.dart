import 'package:customer_app/src/res/colors.dart';
import 'package:customer_app/src/res/dimens.dart';
import 'package:customer_app/src/res/styles.dart';
import 'package:customer_app/src/utils/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomAppBar extends StatelessWidget {
  final double barHeight = Dimens.toolbar_height;
  final bool isLogoVisible;
  final bool isBackEnable;
  final bool isTitleVisible;
  final bool isDateVisible;
  final String title;
  final bool isSearchVisible;
  final bool isReportOnMail;
  final bool isFeedbackVisible;
  final bool isAvatarVisible;
  final String userName;
  final String avatarName;
  final Function onBackTap;
  final Function onSearchTap;
  final Function onReportOnMailTap;
  final Function onFeedbackTap;
  final Function onAvatarTap;

  CustomAppBar(
      {this.isLogoVisible = false,
      this.isBackEnable = false,
      this.isTitleVisible = false,
      this.isDateVisible = false,
      this.title = 'Title',
      this.isSearchVisible = false,
      this.isReportOnMail = false,
      this.isFeedbackVisible = false,
      this.isAvatarVisible = false,
      this.userName = '',
      this.avatarName = 'a1.png',
      this.onBackTap,
      this.onSearchTap,
      this.onReportOnMailTap,
      this.onFeedbackTap,
      this.onAvatarTap});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Material(
      elevation: Dimens.elevation_8dp,
      child: Container(
        padding:
            EdgeInsets.only(top: statusBarHeight, right: Dimens.padding_16dp),
        height: statusBarHeight + barHeight,
        decoration: BoxDecoration(
          color: AppColors.colorPrimary,
        ),
        child: Row(
          children: <Widget>[
            buildLeftFields(context),
            buildRightFields(context),
          ],
        ),
      ),
    );
  }

  Widget buildLeftFields(context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          buildLogo(),
          buildBack(context),
          buildTitle(),
        ],
      ),
    );
  }

  Widget buildLogo() {
    if (isLogoVisible) {
      return Container(
        margin: EdgeInsets.only(
            left: Dimens.margin_16dp, right: Dimens.margin_16dp),
        child: Image.asset(
          'assets/images/bar_name.png',
        ),
      );
    } else
      return Container();
  }

  Widget buildBack(context) {
    if (isBackEnable) {
      return Material(
        color: Colors.transparent,
        child: Ink.image(
          image: AssetImage('assets/images/back.png'),
          width: Dimens.btn_width_48dp,
          height: Dimens.btn_height_48dp,
          child: InkWell(
            onTap: () {
              AppNavigator.popBackStack(context);
            },
            child: null,
          ),
        ),
      );
    } else
      return SizedBox(width: Dimens.margin_16dp);
  }

  Widget buildTitle() {
    if (isTitleVisible && isDateVisible) {
      String date = DateFormat("dd MMM yyyy").format(DateTime.now());
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            title,
            style: Styles.headlineTextStyle,
          ),
          Text(
            date,
            style: Styles.body2TextStyle.copyWith(color: AppColors.white),
          ),
        ],
      );
    } else if (isTitleVisible) {
      return Text(
        title,
        style: Styles.headlineTextStyle,
      );
    } else
      return Container();
  }

  Widget buildRightFields(BuildContext context) {
    return Row(
      children: <Widget>[
        buildSearch(context),
        buildReportOnMail(context),
        buildFeedback(context),
        buildAvatar(),
      ],
    );
  }

  Widget buildSearch(BuildContext context) {
    if (isSearchVisible) {
      return Material(
        color: Colors.transparent,
        child: Ink.image(
          image: AssetImage('assets/images/search.png'),
          width: Dimens.btn_width_40dp,
          height: Dimens.btn_height_40dp,
          child: InkWell(
            //onTap: onSearchTap,
            onTap: () {
              //AppNavigator.launchCustomerListPage(context);
            },
            child: null,
          ),
        ),
      );
    } else
      return Container();
  }

  Widget buildReportOnMail(BuildContext context) {
    if (isReportOnMail) {
      return Material(
        color: Colors.transparent,
        child: Ink.image(
          image: AssetImage('assets/images/export.png'),
          width: Dimens.btn_width_40dp,
          height: Dimens.btn_height_40dp,
          child: InkWell(
            onTap: onReportOnMailTap,
            child: null,
          ),
        ),
      );
    } else
      return Container();
  }

  Widget buildFeedback(BuildContext context) {
    if (isFeedbackVisible) {
      return Material(
        color: Colors.transparent,
        child: Ink.image(
          image: AssetImage('assets/images/feedback.png'),
          width: Dimens.btn_width_40dp,
          height: Dimens.btn_height_40dp,
          child: InkWell(
            //onTap: onFeedbackTap,
            onTap: () {
              //AppNavigator.launchFeedbackPage(context, title);
            },
            child: null,
          ),
        ),
      );
    } else
      return Container();
  }

  Widget buildAvatar() {
    //getEmployeeName().then((name) {

    if (isAvatarVisible) {
      return Material(
          color: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.only(left: Dimens.padding_8dp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: AppColors.transparent,
                  radius: 12,
                  child: Ink.image(
                    //image: AssetImage('assets/images/avtar.png'),
                    image: AssetImage('assets/images/$avatarName'),
                    width: Dimens.btn_width_40dp,
                    height: Dimens.btn_height_40dp,
                    child: InkWell(
                      onTap: onAvatarTap,
                      child: null,
                    ),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 40),
                  child: Text(
                    userName,
                    textAlign: TextAlign.center,
                    style: Styles.baseTextStyle
                        .copyWith(fontSize: Dimens.font_10sp),
                    maxLines: 1,
                    //overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ));
    } else
      return Container();
    //});
  }

  /*Future<String> getAvatarName() async {
    SPUtil spUtil = await SPUtil.getInstance();
    Employee employee = spUtil.getEmployee(SPKeys.EMPLOYEE);
    print('avatar name1: ${employee.avatarName}');
    return employee.avatarName;
  }*/
}
