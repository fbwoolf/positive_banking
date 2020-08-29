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
