import 'package:flutter/material.dart';

class EmployeeDetailsWidget extends StatelessWidget {
  final dynamic imageUrl;
  final dynamic firstName;
  final dynamic lastName;
  final dynamic email;
  final dynamic contactNumber;
  final dynamic age;
  final dynamic dob;
  final dynamic salary;
  final dynamic address;

  const EmployeeDetailsWidget({
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        _employeeProfileImage(),
        SizedBox(height: 50),
        _employeeInfo(
          "Full Name",
          "${firstName + " " + lastName}",
        ),
        _employeeInfo(
          "Email",
          "$email",
        ),
        _employeeInfo(
          "Age",
          "${age.toString()}",
        ),
        _employeeInfo(
          "Date of birth",
          "$dob",
        ),
        _employeeInfo(
          "Address",
          "$address",
        ),
        _employeeInfo(
          "Contact Number",
          "$contactNumber",
        ),
        _employeeInfo(
          "Salary",
          "$salary",
        )
      ],
    );
  }

  Widget _employeeProfileImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(5000),
          child: Hero(
            tag: firstName,
            child: Image(
              height: 100,
              width: 100,
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }

  Widget _employeeInfo(String left, String right) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 5),
      child: Card(
        color: Colors.redAccent,
        elevation: 2.0,
        shadowColor: Colors.redAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: _employeeInfoUtil(left, right),
        ),
      ),
    );
  }

  Widget _employeeInfoUtil(String left, String right) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "$left :",
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
          maxLines: 2,
        ),
        Flexible(
          child: Text(
            right,
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
