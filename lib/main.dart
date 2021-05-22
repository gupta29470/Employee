import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import './screens/splash_screen.dart';
import './screens/employee_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.redAccent,
      ),
      home: SplashScreen(),
      routes: {
        "home": (context) => EmployeeListScreen(),
      },
    );
  }
}
