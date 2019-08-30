import 'dart:async';
import 'dart:collection';

import 'package:customer_app/src/data/local_pref/shared_preferences_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'api.dart';
import '../models/common/api_response.dart';

class RestClient {
  Dio _dio;

  RestClient() {
    BaseOptions options = new BaseOptions(
      baseUrl: Api.BASE_URL,
      /*connectTimeout: 50000,
      receiveTimeout: 50000,*/
    );
    _dio = Dio(options);
    _dio.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));
  }

  Future<ApiResponse> get(BuildContext context, apiName,
      {body, Map<String, dynamic> header, Options option}) async {
    Map<String, dynamic> headers = HashMap();

    SPUtil spUtil = await SPUtil.getInstance();
    String authorizationToken = spUtil.getString(SPKeys.TOKEN);
    String tokenWithBearer = 'Bearer $authorizationToken';
    if (spUtil.getEmployee(SPKeys.EMPLOYEE) != null &&
        authorizationToken != null) {
      headers.putIfAbsent('authorization', () => tokenWithBearer);
    }

    if (header != null) {
      headers.addAll(header);
    }

    if (option != null) {
      option.headers = headers;
    } else {
      option = Options(method: "get");
      option.headers = headers;
    }

    try {
      Response response =
          await _dio.request(apiName, data: body, options: option);
      //_dio.get(url, queryParameters: body);

      if (response.statusCode < 200 || response.statusCode > 400) {
        return ApiResponse(false, 'Server error please try again later!', null);
      }

      return ApiResponse.fromJson(response.data);
    } catch (e) {
      var error = e as DioError;
      if (error.response.statusCode == 401) {
        doLogout(context);
        //AppNavigator.launchAuthFailedPage(context);
      }
      return ApiResponse(false, 'Server error please try again later!', null);
    }
  }

  Future<ApiResponse> post(BuildContext context, apiName,
      {body, Map<String, dynamic> header, Options option}) async {
    Map<String, dynamic> headers = HashMap();

    SPUtil spUtil = await SPUtil.getInstance();
    String authorizationToken = spUtil.getString(SPKeys.TOKEN);
    String tokenWithBearer = 'Bearer $authorizationToken';
    if (spUtil.getEmployee(SPKeys.EMPLOYEE) != null &&
        authorizationToken != null) {
      headers.putIfAbsent('authorization', () => tokenWithBearer);
    }

    if (header != null) {
      headers.addAll(header);
    }

    if (option != null) {
      option.headers = headers;
    } else {
      option = Options(method: "post");
      option.headers = headers;
    }

    try {
      Response response =
          await _dio.request(apiName, data: body, options: option);

      if (response.statusCode < 200 || response.statusCode > 400) {
        return ApiResponse(false, 'Server error please try again later!', null);
      }

      if (apiName == Api.LOGIN && response.headers.value('token') != null) {
        String token = response.headers.value('token');
        SPUtil spUtil = await SPUtil.getInstance();
        spUtil.putString(SPKeys.TOKEN, token);
      }

//      var json = _decoder.convert(response.data);
//      var json = response.data;
      return ApiResponse.fromJson(response.data);
    } catch (e) {
      var error = e as DioError;
      if (error.response.statusCode == 401) {
        doLogout(context);
        //AppNavigator.launchAuthFailedPage(context);
      }
      return ApiResponse(false, 'Server error please try again later!', null);
    }
  }

  Future<ApiResponse> put(BuildContext context, apiName,
      {body, Map<String, dynamic> header, Options option}) async {
    Map<String, dynamic> headers = HashMap();

    SPUtil spUtil = await SPUtil.getInstance();
    String authorizationToken = spUtil.getString(SPKeys.TOKEN);
    String tokenWithBearer = 'Bearer $authorizationToken';
    if (spUtil.getEmployee(SPKeys.EMPLOYEE) != null &&
        authorizationToken != null) {
      headers.putIfAbsent('authorization', () => tokenWithBearer);
    }

    if (header != null) {
      headers.addAll(header);
    }

    if (option != null) {
      option.headers = headers;
    } else {
      option = Options(method: "put");
      option.headers = headers;
    }

    try {
      Response response =
          await _dio.request(apiName, data: body, options: option);

      /*if (response.statusCode < 200 || response.statusCode > 400) {
        return ApiResponse(false, 'Server error please try again later!', null);
      }*/

      if (response.statusCode < 200 || response.statusCode > 400) {
        return ApiResponse(false, 'Server error please try again later!', null);
      }

      return ApiResponse.fromJson(response.data);
    } catch (e) {
      var error = e as DioError;
      if (error.response.statusCode == 401) {
        doLogout(context);
        //AppNavigator.launchAuthFailedPage(context);
      }
      return ApiResponse(false, 'Server error please try again later!', null);
    }
  }

  void doLogout(context) async {
    SPUtil spUtil = await SPUtil.getInstance();
    spUtil.remove(SPKeys.EMPLOYEE);
    spUtil.remove(SPKeys.TOKEN);
  }
}

final RestClient restClientNew = RestClient();
