import 'package:flutter/foundation.dart';

class EmployeeModel {
  final dynamic id;
  final dynamic imageUrl;
  final dynamic firstName;
  final dynamic lastName;
  final dynamic email;
  final dynamic contactNumber;
  final dynamic age;
  final dynamic dob;
  final dynamic salary;
  final dynamic address;

  EmployeeModel({
    @required this.id,
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

  factory EmployeeModel.fromFirestore(Map<dynamic, dynamic> data) {
    return EmployeeModel(
        id: data["id"] ?? -1,
        imageUrl: data["imageUrl"] ?? "https://i.pravatar.cc/300",
        firstName: data["firstName"] ?? "Empty",
        lastName: data["lastName"] ?? "Empty",
        email: data["email"] ?? "Empty",
        contactNumber: data["contactNumber"] ?? "Empty",
        age: data["age"] ?? "Empty",
        dob: data["dob"] ?? "Empty",
        salary: data["salary"] ?? -1,
        address: data["address"] ?? "Empty");
  }
}
