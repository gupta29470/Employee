import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/employees_provider.dart';
import '../widgets/employees_list_view_widget.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({Key key}) : super(key: key);

  @override
  _EmployeeListScreenState createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EmployeesProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Employees List"),
          centerTitle: true,
        ),
        body: Consumer<EmployeesProvider>(
          builder: (context, employeesProvider, _) => EmployeeListViewWidget(
            employeesProvider: employeesProvider,
          ),
        ),
      ),
    );
  }
}
