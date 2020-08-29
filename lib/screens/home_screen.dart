import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:positive_banking/bloc/account/account_bloc.dart';
import 'package:positive_banking/models/models.dart';
import 'package:positive_banking/routes.dart';
import 'package:positive_banking/services/services.dart';
import 'package:positive_banking/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const _locale = 'en';
  final _formKey = GlobalKey<FormState>();

  // Text field nodes
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();

  // Text field controllers
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();

  // Form state
  String _averageBalance = '';
  String _transaction1 = '';
  String _transaction2 = '';
  bool _autoValidate = false;
  bool _enableBtn = false;

  // Format number to USD currency
  String _formatNumber(String string) {
    final format = NumberFormat.decimalPattern(_locale);
    return format.format(int.parse(string));
  }

  // Get currency symbol
  String get currency =>
      NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;

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
        child: BlocBuilder<AccountBloc, AccountState>(
          builder: (context, state) {
            if (state is AccountLoadInProgress) {
              return LoadingIndicator();
            } else if (state is AccountLoadSuccess) {
              return Form(
                autovalidate: _autoValidate,
                key: _formKey,
                onChanged: () => setState(
                  () => _enableBtn = _averageBalance.isNotEmpty &&
                      _transaction1.isNotEmpty &&
                      _transaction2.isNotEmpty,
                ),
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
                      controller: _controller1,
                      decoration: InputDecoration(
                        prefixText: currency,
                        hintText: ' Average Balance',
                      ),
                      focusNode: _focusNode1,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatter: ValidatorInputFormatter(
                        editingValidator: DecimalNumberEditingRegexValidator(),
                      ),
                      onChanged: (string) {
                        string = _formatNumber(string.replaceAll(',', ''));
                        _controller1.text = string;
                        _controller1.selection = TextSelection.fromPosition(
                          TextPosition(offset: string.length),
                        );
                        setState(
                            () => _averageBalance = string.replaceAll(',', ''));
                      },
                      onEditingComplete: () {
                        bool valid = DecimalNumberSubmitValidator()
                            .isValid(_averageBalance);
                        valid
                            ? _focusNode1.nextFocus()
                            : FocusScope.of(context).requestFocus(_focusNode1);
                      },
                      style: null,
                      textAlign: TextAlign.start,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter a balance' : null,
                    ),
                    SizedBox(height: 20.0),
                    FormattedInput(
                      autoFocus: false,
                      controller: _controller2,
                      decoration: InputDecoration(
                        prefixText: currency,
                        hintText: ' Transaction 1',
                      ),
                      focusNode: _focusNode2,
                      inputFormatter: ValidatorInputFormatter(
                        editingValidator: DecimalNumberEditingRegexValidator(),
                      ),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      onChanged: (string) {
                        string = _formatNumber(string.replaceAll(',', ''));
                        _controller2.text = string;
                        _controller2.selection = TextSelection.fromPosition(
                          TextPosition(offset: string.length),
                        );
                        setState(
                            () => _transaction1 = string.replaceAll(',', ''));
                      },
                      onEditingComplete: () {
                        bool valid = DecimalNumberSubmitValidator()
                            .isValid(_transaction1);
                        valid
                            ? _focusNode2.nextFocus()
                            : FocusScope.of(context).requestFocus(_focusNode2);
                      },
                      style: null,
                      textAlign: TextAlign.start,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter a transaction' : null,
                    ),
                    SizedBox(height: 20.0),
                    FormattedInput(
                      autoFocus: false,
                      controller: _controller3,
                      decoration: InputDecoration(
                        prefixText: currency,
                        hintText: ' Transaction 2',
                      ),
                      focusNode: _focusNode3,
                      inputFormatter: ValidatorInputFormatter(
                        editingValidator: DecimalNumberEditingRegexValidator(),
                      ),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      onChanged: (string) {
                        string = _formatNumber(string.replaceAll(',', ''));
                        _controller3.text = string;
                        _controller3.selection = TextSelection.fromPosition(
                          TextPosition(offset: string.length),
                        );
                        setState(
                            () => _transaction2 = string.replaceAll(',', ''));
                      },
                      onEditingComplete: () {
                        bool valid = DecimalNumberSubmitValidator()
                            .isValid(_transaction2);
                        valid
                            ? _focusNode3.unfocus()
                            : FocusScope.of(context).requestFocus(_focusNode3);
                      },
                      style: null,
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
                              Account account = new Account(
                                balance: _averageBalance,
                                transactions: [
                                  _transaction1,
                                  _transaction2,
                                ],
                              );
                              Navigator.pushReplacementNamed(
                                context,
                                detailsRoute,
                                arguments: account,
                              );
                            } else {
                              _autoValidate = true;
                            }
                          },
                          submitText: 'Submit',
                          enabled: _enableBtn,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
