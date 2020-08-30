part of 'account_bloc.dart';

class AccountState extends Equatable {
  final String balance;
  final String id;
  final List<String> transactions;

  const AccountState({
    this.balance,
    this.id,
    this.transactions,
  });

  AccountState copyWith(
      {String balance, String id, List<String> transactions}) {
    return AccountState(
      balance: balance ?? this.balance,
      id: id ?? this.id,
      transactions: transactions ?? this.transactions,
    );
  }

  @override
  List<Object> get props => [balance, id, transactions];
}

class AccountInitial extends AccountState {}

class AccountLoadInProgress extends AccountState {}

class AccountLoadSuccess extends AccountState {
  final String balance;
  final String id;
  final List<String> transactions;

  const AccountLoadSuccess({
    @required this.balance,
    @required this.id,
    @required this.transactions,
  });

  @override
  List<Object> get props => [balance, id, transactions];
}

class AccountLoadFailure extends AccountState {}
