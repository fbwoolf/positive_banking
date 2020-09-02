part of 'account_bloc.dart';

class AccountState extends Equatable {
  final String balance;
  final Good good;
  final String id;
  final List<String> transactions;

  const AccountState({
    this.balance,
    this.good,
    this.id,
    this.transactions,
  });

  AccountState copyWith(
      {String balance, Good good, String id, List<String> transactions}) {
    return AccountState(
      balance: balance ?? this.balance,
      good: good ?? this.good,
      id: id ?? this.id,
      transactions: transactions ?? this.transactions,
    );
  }

  @override
  List<Object> get props => [balance, good, id, transactions];
}

class AccountInitial extends AccountState {}

class AccountLoadInProgress extends AccountState {}

class AccountLoadSuccess extends AccountState {
  final String balance;
  final Good good;
  final String id;
  final List<String> transactions;

  const AccountLoadSuccess({
    @required this.balance,
    @required this.good,
    @required this.id,
    @required this.transactions,
  });

  @override
  List<Object> get props => [balance, good, id, transactions];
}

class AccountLoadFailure extends AccountState {}
