import 'package:equatable/equatable.dart';

class Account extends Equatable {
  final String balance;
  final String id;
  final List<String> transactions;

  Account({
    this.balance = '',
    this.id = '',
    this.transactions,
  });

  @override
  List<Object> get props => [balance, id, transactions];
}
