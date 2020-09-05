import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:positive_banking/bloc/account/account_bloc.dart';
import 'package:positive_banking/models/account.dart';
import 'package:positive_banking/models/good.dart';
import 'package:positive_banking/repositories/account_repository.dart';

class MockAccountRepository extends Mock implements AccountRepository {}

void main() {
  final account = Account(
    balance: '100',
    good: Good(),
    id: '1',
    transactions: ['10', '20'],
  );

  group('AccountBloc', () {
    MockAccountRepository accountRepository;
    AccountBloc accountBloc;

    setUp(() {
      accountRepository = MockAccountRepository();
      accountBloc = AccountBloc(accountRepository: accountRepository);
    });

    tearDown(() {
      accountBloc?.close();
    });

    test('throws AssertionError when accountRepository is null', () {
      expect(() => AccountBloc(accountRepository: null), throwsAssertionError);
    });

    test('has a correct initial state', () {
      expect(accountBloc.state, AccountInitial());
    });

    group('AccountLoaded', () {
      blocTest(
        'emits [AccountLoadInProgress, AccountLoadSuccess] when account repository returns account',
        build: () {
          when(accountRepository.fetchAccountFromFakeApi('1')).thenAnswer(
            (_) => Future.value(account),
          );
          return accountBloc;
        },
        act: (bloc) => bloc.add(AccountLoaded(id: '1')),
        expect: [
          AccountLoadInProgress(),
          AccountLoadSuccess(
              balance: account.balance,
              good: account.good,
              id: account.id,
              transactions: account.transactions),
        ],
      );

      blocTest(
        'emits [AccountLoadInProgress, AccountLoadFailure] when account repository throws error',
        build: () {
          when(accountRepository.fetchAccountFromFakeApi('1'))
              .thenThrow('Account Error');
          return accountBloc;
        },
        act: (bloc) => bloc.add(AccountLoaded(id: '1')),
        expect: [
          AccountLoadInProgress(),
          AccountLoadFailure(),
        ],
      );
    });
  });
}
