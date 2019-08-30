import 'package:customer_app/src/data/models/employee.dart';
import 'package:customer_app/src/data/network/api.dart';
import 'package:customer_app/src/data/models/common/api_response.dart';
import 'package:customer_app/src/data/network/rest_client.dart';
import 'package:flutter/material.dart';

class Repository {


  Future<Employee> login(BuildContext context, String email, String pin) async {
    try {
      ApiResponse apiResponse = await restClientNew
          .post(context, Api.LOGIN, body: {"email": email, "pin": pin});

      if (apiResponse.status) {
        var data = apiResponse.data as Map<String, dynamic>;
        return Employee.fromJson(data);
      } else {
        return Future.error(apiResponse.message);
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<ApiResponse> forgotPassword(BuildContext context, String email) async {
    try {
      ApiResponse apiResponse = await restClientNew
          .post(context, Api.FORGOT_PASSWORD, body: {"email": email});

      if (apiResponse.status) {
        return apiResponse;
      } else {
        return Future.error(apiResponse.message);
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }



  /*Future<List<Category>> fetchServiceCategoryList(BuildContext context) async {
    try {
      ApiResponse apiResponse =
          await restClientNew.get(context, Api.GET_SERVICE_CATEGORIES);
      //await restClientNew.post(Api.GET_SERVICE_CATEGORIES, body: {"merchantId": Constants.MERCHANT_ID});

      if (apiResponse.status) {
        var data = apiResponse.data as List<dynamic>;
        if (data != null) {
          var categoryList = List<Category>();
          data.forEach((v) {
            categoryList.add(Category.fromJson(v));
          });
          return categoryList;
        } else {
          return Future.error(apiResponse.message);
        }
      } else {
        return Future.error(apiResponse.message);
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }*/



  Future<List<String>> fetchStylist() {
    List<String> stylistList = [
      "Any",
      "Madeleine K.",
      "Penelope D.",
      "Rose P.",
      "Stephanie"
    ];
    return Future.delayed(Duration(seconds: 2), () {
      return List.generate(5, (i) {
        return stylistList[i];
      });
    });
  }
}
