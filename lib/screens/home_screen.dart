import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:positive_banking/bloc/account/account_bloc.dart';
import 'package:positive_banking/routes.dart';
import 'package:positive_banking/services/services.dart';
import 'package:positive_banking/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();

  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ownership Economy',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 20.0,
        ),
        child: BlocConsumer<AccountBloc, AccountState>(
          listener: (context, state) {
            if (state is AccountLoadFailure) {
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(content: Text('Account load failed')),
                );
            }
          },
          builder: (context, state) {
            if (state is AccountLoadInProgress) {
              return LoadingIndicator();
            }
            return Form(
              autovalidate: _autoValidate,
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Hero(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        'assets/logo.png',
                        width: 80,
                        height: 80,
                      ),
                    ),
                    tag: 'logo',
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Make a Good transaction',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  FormattedInput(
                    autoFocus: false,
                    decoration: InputDecoration(
                      prefixText: '\$',
                      hintText: ' Average Balance',
                    ),
                    focusNode: _focusNode1,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    initialValue: state.balance,
                    inputFormatter: ValidatorInputFormatter(
                      editingValidator: DecimalNumberEditingRegexValidator(),
                    ),
                    onChanged: (value) {
                      context.bloc<AccountBloc>().add(
                            AccountAverageBalanceChanged(balance: value),
                          );
                    },
                    onEditingComplete: () {
                      bool valid =
                          DecimalNumberSubmitValidator().isValid(state.balance);
                      valid
                          ? _focusNode1.nextFocus()
                          : FocusScope.of(context).requestFocus(_focusNode1);
                    },
                    textAlign: TextAlign.start,
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a balance' : null,
                  ),
                  SizedBox(height: 20.0),
                  FormattedInput(
                    autoFocus: false,
                    decoration: InputDecoration(
                      prefixText: '\$',
                      hintText: ' Transaction 1',
                    ),
                    focusNode: _focusNode2,
                    initialValue: state.transactions[0],
                    inputFormatter: ValidatorInputFormatter(
                      editingValidator: DecimalNumberEditingRegexValidator(),
                    ),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) {
                      context.bloc<AccountBloc>().add(
                            AccountTransactionsChanged(
                              transactions: [value, state.transactions[1]],
                            ),
                          );
                    },
                    onEditingComplete: () {
                      bool valid = DecimalNumberSubmitValidator()
                          .isValid(state.transactions[0]);
                      valid
                          ? _focusNode2.nextFocus()
                          : FocusScope.of(context).requestFocus(_focusNode2);
                    },
                    textAlign: TextAlign.start,
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a transaction' : null,
                  ),
                  SizedBox(height: 20.0),
                  FormattedInput(
                    autoFocus: false,
                    decoration: InputDecoration(
                      prefixText: '\$',
                      hintText: ' Transaction 2',
                    ),
                    focusNode: _focusNode3,
                    initialValue: state.transactions[1],
                    inputFormatter: ValidatorInputFormatter(
                      editingValidator: DecimalNumberEditingRegexValidator(),
                    ),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) {
                      context.bloc<AccountBloc>().add(
                            AccountTransactionsChanged(
                              transactions: [state.transactions[1], value],
                            ),
                          );
                    },
                    onEditingComplete: () {
                      bool valid = DecimalNumberSubmitValidator()
                          .isValid(state.transactions[1]);
                      valid
                          ? _focusNode3.unfocus()
                          : FocusScope.of(context).requestFocus(_focusNode3);
                    },
                    textAlign: TextAlign.start,
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a transaction' : null,
                  ),
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: ActionButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.pushReplacementNamed(
                              context,
                              detailsRoute,
                            );
                          } else {
                            _autoValidate = true;
                          }
                        },
                        submitText: 'Submit',
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
