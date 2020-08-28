import 'dart:math' as math;

import 'package:positive_banking/models/models.dart';

class GoodService {
  // Dollar Value of Ownership (Calculated as the max of ($1000 OR Average Balance) multiplied by 0.5%)
  double calculateGoodShares(String averageBalance) {
    double multiplier = 0.5;
    double maxBalance = math.max(1000, double.parse(averageBalance));
    double ownership = maxBalance * multiplier;
    return ownership;
  }

  // Acres (Calculated as the sum of transactions multiplied by 0.03)
  // Trees (Calculated as the Acres multiplied by 900 and rounded to the nearest integer)
  // Animals (Calculated as the Acres multiplied by 12000 and rounded to the nearest integer)
  Impact calculateGoodImpact(List<String> transactions) {
    double sumOfTransactions = transactions
        .map<double>((v) => double.parse(v))
        .fold(0, (prev, curr) => prev + curr);
    double acres = sumOfTransactions * 0.03;
    int trees = (sumOfTransactions * 900).round();
    int animals = (acres * 12000).round();
    Impact impact = new Impact(
      acres: acres,
      trees: trees,
      animals: animals,
    );
    return impact;
  }
}
