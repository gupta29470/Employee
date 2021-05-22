import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/employee_model.dart';
import '../services/database_services.dart';

class EmployeesProvider extends ChangeNotifier {
  final _employeeSnapshots = <DocumentSnapshot>[];
  int _documentLimit = 50;
  bool _hasNext = true;
  bool _isFetchingUsers = false;

  bool get hasNext => _hasNext;

  bool get fetchingUsers => _isFetchingUsers;

  List<EmployeeModel> get employees => _employeeSnapshots.map(
        (snapshot) {
          final employee = snapshot.data();
          return EmployeeModel.fromFirestore(employee);
        },
      ).toList();

  Future fetchNextEmployees() async {
    if (_isFetchingUsers) {
      return;
    }
    _isFetchingUsers = true;
    try {
      final snapshot = await DatabaseService.databaseServiceInstance.getUsers(
        _documentLimit,
        startAfter:
            _employeeSnapshots.isNotEmpty ? _employeeSnapshots.last : null,
      );
      _employeeSnapshots.addAll(snapshot.docs);

      if (snapshot.docs.length < _documentLimit){
        _hasNext = false;
      }
    } catch (error) {
      print(error.toString());
    }
    _isFetchingUsers = false;
    notifyListeners();
  }
}
