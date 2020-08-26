import 'package:flutter/material.dart';
import 'package:positive_banking/routes.dart';
import 'package:positive_banking/screens/home_screen.dart';
import 'package:positive_banking/services/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: homeRoute,
      onGenerateRoute: RouterService.generateRoute,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'Positive Banking',
    );
  }
}
