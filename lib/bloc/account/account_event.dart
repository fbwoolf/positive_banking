part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class AccountLoaded extends AccountEvent {
  final String id;

  const AccountLoaded(this.id);

  @override
  List<Object> get props => [id];
}

class AccountAverageBalanceChanged extends AccountEvent {
  final String balance;

  const AccountAverageBalanceChanged({this.balance});

  @override
  List<Object> get props => [balance];
}

class AccountTransactionsChanged extends AccountEvent {
  final List<String> transactions;

  const AccountTransactionsChanged({this.transactions});

  @override
  List<Object> get props => [transactions];
}

class CalculateGood extends AccountEvent {
  final String balance;
  final List<String> transactions;

  const CalculateGood({this.balance, this.transactions});

  @override
  List<Object> get props => [balance, transactions];
}
