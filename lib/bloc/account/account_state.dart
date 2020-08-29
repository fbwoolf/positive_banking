part of 'account_bloc.dart';

@immutable
abstract class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object> get props => [];
}

class AccountInitial extends AccountState {}

class AccountLoadInProgress extends AccountState {}

class AccountLoadSuccess extends AccountState {
  final Account account;

  const AccountLoadSuccess({@required this.account}) : assert(account != null);

  @override
  List<Object> get props => [account];
}

class AccountLoadFailure extends AccountState {}
