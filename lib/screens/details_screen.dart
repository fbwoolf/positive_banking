import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:positive_banking/models/models.dart';
import 'package:positive_banking/services/services.dart';

class DetailsScreen extends StatelessWidget {
  final Account account;
  final formatNumber = new NumberFormat();

  DetailsScreen({
    this.account,
  });

  @override
  Widget build(BuildContext context) {
    double shares = GoodService().calculateGoodShares(account.balance);
    Impact impact = GoodService().calculateGoodImpact(account.transactions);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Good Details'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 20.0,
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            Text(
              'Good Shares',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Card(
              child: ListTile(
                leading: Hero(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/logo.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                  tag: 'logo',
                ),
                title: Text('${formatNumber.format(shares)} Shares'),
                subtitle: Text('You\'ve Unlocked'),
              ),
            ),
            SizedBox(height: 40.0),
            Text(
              'Good Impact',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Card(
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/logo.png',
                    width: 40,
                    height: 40,
                  ),
                ),
                title: Text('${formatNumber.format(impact.acres)} Acres'),
                subtitle: Text('You\'ve Protected'),
              ),
            ),
            Card(
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/logo.png',
                    width: 40,
                    height: 40,
                  ),
                ),
                title: Text('${formatNumber.format(impact.trees)} Trees'),
                subtitle: Text('You\'ve Protected'),
              ),
            ),
            Card(
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/logo.png',
                    width: 40,
                    height: 40,
                  ),
                ),
                title: Text('${formatNumber.format(impact.animals)} Animals'),
                subtitle: Text('You\'ve Protected'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
