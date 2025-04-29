// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:intermediate_poc/dio_api_calls.dart';
// import 'package:intermediate_poc/shared_preferences.dart';
// import 'package:intermediate_poc/username_sharedpreference.dart';
// // import 'package:intermediate_poc/sqlflite_poc.dart';
import 'package:intermediate_poc/battery_level_page.dart';
import 'package:intermediate_poc/shared_preferences.dart';
import 'package:intermediate_poc/username_sharedpreference.dart';
//
// void main () {
//   runApp(const MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//   return MaterialApp(
//     // home:DioAPiExamples()
//     //   home:LoginPage()
//           home:UsernamePage()
//
//   );
//
//   }
// }
//


import 'package:flutter/material.dart';
import 'package:intermediate_poc/dio_api_calls.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Sign-In POC',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const UsernamePage(),
      // home: LoginPage(),
      // home: DioAPiExamples(),
      //   home: BatteryLevelPage()

    );
  }
}
