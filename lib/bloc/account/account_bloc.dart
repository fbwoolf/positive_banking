import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:positive_banking/models/account.dart';
import 'package:positive_banking/repositories/account_repository.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final AccountRepository accountRepository;

  AccountBloc({@required this.accountRepository})
      : assert(accountRepository != null),
        super(AccountInitial());

  @override
  Stream<AccountState> mapEventToState(
    AccountEvent event,
  ) async* {
    if (event is AccountLoaded) {
      yield* _mapAccountLoadedToState(event);
    }
  }

  Stream<AccountState> _mapAccountLoadedToState(AccountLoaded event) async* {
    yield AccountLoadInProgress();
    try {
      final account = await accountRepository.fetchAccountFromFakeApi(event.id);
      yield AccountLoadSuccess(account: account);
    } catch (_) {
      yield AccountLoadFailure();
    }
  }
}
