import 'package:customer_app/src/data/models/common/ui_status.dart';
import 'package:customer_app/src/data/models/employee.dart';
import 'package:customer_app/src/data/repository/repository.dart';
import 'package:customer_app/src/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

import 'bloc_helpers/bloc_provider.dart';


class ApplicationBloc with Validator implements BlocBase {
  final _repository = Repository();


  final _uiStatus = BehaviorSubject<UIStatus>.seeded(
      UIStatus(isLoading: false, success: false, message: ''));

  final _employeeList = BehaviorSubject<List<Employee>>();


  Stream<UIStatus> get uiStatus => _uiStatus.stream;

  Observable<List<Employee>> get employeeList => _employeeList.stream;

  List<Employee> get employeeListValue => _employeeList.value;

  Function(UIStatus) get updateUIStatus => _uiStatus.sink.add;


  @override
  void dispose() {
    _uiStatus.close();
    _employeeList.close();
  }
}
