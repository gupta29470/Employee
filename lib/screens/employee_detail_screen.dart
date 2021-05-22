import 'package:flutter/material.dart';

import '../widgets/employees_details_widget.dart';

class EmployeeDetailScreen extends StatelessWidget {
  final dynamic imageUrl;
  final dynamic firstName;
  final dynamic lastName;
  final dynamic email;
  final dynamic contactNumber;
  final dynamic age;
  final dynamic dob;
  final dynamic salary;
  final dynamic address;

  const EmployeeDetailScreen({
    @required this.imageUrl,
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.contactNumber,
    @required this.age,
    @required this.dob,
    @required this.salary,
    @required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(firstName + " " + lastName),
        centerTitle: true,
      ),
      body: EmployeeDetailsWidget(
        firstName: firstName,
        lastName: lastName,
        imageUrl: imageUrl,
        address: address,
        age: age,
        salary: salary,
        dob: dob,
        contactNumber: contactNumber,
        email: email,
      ),
    );
  }
}
