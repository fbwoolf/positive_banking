import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:positive_banking/bloc/account/account_bloc.dart';
import 'package:positive_banking/repositories/account_repository.dart';
import 'package:positive_banking/routes.dart';
import 'package:positive_banking/services/services.dart';
import 'package:positive_banking/shared/shared.dart';
import 'package:uuid/uuid.dart';

import 'bloc/simple_bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  runApp(
    BlocProvider(
      create: (context) {
        return AccountBloc(accountRepository: AccountRepository())
          // Generating a unique id to load a fake account
          ..add(AccountLoaded(id: Uuid().v1()));
      },
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
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
