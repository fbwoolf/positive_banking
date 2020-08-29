import 'dart:math';

import 'package:positive_banking/models/account.dart';

// This repository would typically be extracted out into its own package
class AccountRepository {
  Future<Account> fetchAccountFromFakeApi(String id) {
    // Fake network delay
    return Future.delayed(Duration(seconds: 1), () {
      return Account(
        id: id,
        balance:
            (100 + Random().nextInt(10000) + Random().nextDouble()).toString(),
        transactions: [
          (10 + Random().nextInt(1000) + Random().nextDouble()).toString(),
          (10 + Random().nextInt(1000) + Random().nextDouble()).toString(),
        ],
      );
    });
  }
}
