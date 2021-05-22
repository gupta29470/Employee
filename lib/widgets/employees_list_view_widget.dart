import 'package:employee/models/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../providers/employees_provider.dart';
import '../screens/employee_detail_screen.dart';

class EmployeeListViewWidget extends StatefulWidget {
  final EmployeesProvider employeesProvider;

  const EmployeeListViewWidget({
    @required this.employeesProvider,
  });

  @override
  _EmployeeListViewWidgetState createState() => _EmployeeListViewWidgetState();
}

class _EmployeeListViewWidgetState extends State<EmployeeListViewWidget> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
    widget.employeesProvider.fetchNextEmployees();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      if (widget.employeesProvider.hasNext) {
        widget.employeesProvider.fetchNextEmployees();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      padding: EdgeInsets.all(12),
      children: [
        ...widget.employeesProvider.employees
            .map(
              (employee) => Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EmployeeDetailScreen(
                            firstName: employee.firstName,
                            lastName: employee.lastName,
                            imageUrl: employee.imageUrl,
                            address: employee.address,
                            age: employee.age,
                            salary: employee.salary,
                            dob: employee.dob,
                            contactNumber: employee.contactNumber,
                            email: employee.email,
                          ),
                        ),
                      ),
                      child: _employeesListWidget(employee),
                    ),
                  ),
                  Divider(),
                ],
              ),
            )
            .toList(),
        if (widget.employeesProvider.hasNext)
          _progressIndicatorWidget(),
      ],
    );
  }

  Widget _progressIndicatorWidget() {
    return Center(
          child: InkWell(
            onTap: widget.employeesProvider.fetchNextEmployees,
            child: Container(
              height: 25,
              width: 25,
              child: SpinKitRing(
                color: Colors.redAccent,
                size: 25,
              ),
            ),
          ),
        );
  }

  Widget _employeesListWidget(EmployeeModel employee) {
    return Container(
      height: 50.0,
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5000),
            child: Hero(
              tag: employee.address,
              child: Image(
                height: 50,
                width: 50,
                image: NetworkImage(employee.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 25,
          ),
          Text(
            employee.firstName + "  " + employee.lastName,
            style: TextStyle(color: Colors.redAccent, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
