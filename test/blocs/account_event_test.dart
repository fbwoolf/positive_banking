import 'package:flutter_test/flutter_test.dart';
import 'package:positive_banking/bloc/account/account_bloc.dart';

void main() {
  group('AccountEvent', () {
    group('AccountLoaded', () {
      test('props are [id]', () {
        expect(AccountLoaded(id: '1').props, ['1']);
      });
    });

    group('AccountAverageBalanceChanged', () {
      test('props are [balance]', () {
        expect(AccountAverageBalanceChanged(balance: '100').props, ['100']);
      });
    });

    group('AccountTransactionsChanged', () {
      test('props are [transactions]', () {
        expect(AccountTransactionsChanged(transactions: ['10', '20']).props, [
          ['10', '20']
        ]);
      });
    });

    group('CalculateGood', () {
      test('props are [balance, transactions]', () {
        expect(
            CalculateGood(balance: '100', transactions: ['10', '20']).props, [
          '100',
          ['10', '20']
        ]);
      });
    });
  });
}
