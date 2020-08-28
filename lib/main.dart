import 'package:flutter/material.dart';
import 'package:positive_banking/routes.dart';
import 'package:positive_banking/services/services.dart';
import 'package:positive_banking/shared/shared.dart';

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
        fontFamily: 'Montserrat',
        primarySwatch: goodMoneyColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'Positive Banking',
    );
  }
}
