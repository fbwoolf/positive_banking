import 'package:flutter/material.dart';
import 'package:positive_banking/models/models.dart';
import 'package:positive_banking/routes.dart';
import 'package:positive_banking/screens/home_screen.dart';
import 'package:positive_banking/screens/screens.dart';

class RouterService {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case detailsRoute:
        return MaterialPageRoute(
          builder: (context) => DetailsScreen(),
        );
      case homeRoute:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return _errorRoute();
    }
  }

  // Placeholder for an error screen
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Positive Banking'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
