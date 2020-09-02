import 'package:equatable/equatable.dart';
import 'package:positive_banking/models/good.dart';

class Account extends Equatable {
  final String balance;
  final Good good;
  final String id;
  final List<String> transactions;

  Account({
    this.balance = '',
    this.good,
    this.id = '',
    this.transactions,
  });

  @override
  List<Object> get props => [balance, good, id, transactions];
}
