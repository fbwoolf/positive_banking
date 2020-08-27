import 'package:flutter/material.dart';
import 'package:positive_banking/models/models.dart';
import 'package:positive_banking/services/services.dart';

class DetailsScreen extends StatelessWidget {
  final Account account;

  DetailsScreen({
    this.account,
  });

  @override
  Widget build(BuildContext context) {
    double shares = GoodService().calculateGoodShares(account.balance);
    Impact impact = GoodService().calculateGoodImpact(account.transactions);

    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Details'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 20.0,
        ),
        child: Column(
          children: <Widget>[
            Text(shares.toStringAsFixed(2)),
            Text(impact.acres.toStringAsFixed(2)),
            Text(impact.trees.toString()),
            Text(impact.animals.toString()),
          ],
        ),
      ),
    );
  }
}
