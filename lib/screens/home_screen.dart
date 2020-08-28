import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:positive_banking/models/models.dart';
import 'package:positive_banking/routes.dart';
import 'package:positive_banking/services/services.dart';
import 'package:positive_banking/shared/shared.dart';
import 'package:positive_banking/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const _locale = 'en';
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final _averageBalanceController = TextEditingController();
  final _transaction1Controller = TextEditingController();
  final _transaction2Controller = TextEditingController();

  bool _autoValidate = false;
  bool _enableBtn = false;

  String _formatNumber(String string) {
    final format = NumberFormat.decimalPattern(_locale);
    return format.format(int.parse(string));
  }

  String get currency =>
      NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Positive Banking'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 20.0,
        ),
        child: Form(
          autovalidate: _autoValidate,
          key: _formKey,
          onChanged: () => setState(
            () => _enableBtn = _averageBalanceController.text.isNotEmpty &&
                _transaction1Controller.text.isNotEmpty &&
                _transaction2Controller.text.isNotEmpty,
          ),
          child: Column(
            children: <Widget>[
              Text(
                'Make a Good transaction',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 20.0),
              FormattedInput(
                autoFocus: true,
                controller: _averageBalanceController,
                decoration: InputDecoration(prefixText: currency),
                focusNode: _focusNode1,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatter: ValidatorInputFormatter(
                  editingValidator: DecimalNumberEditingRegexValidator(),
                ),
                onChanged: (string) {
                  string = '${_formatNumber(string.replaceAll(',', ''))}';
                  _averageBalanceController.text = string;
                  _averageBalanceController.selection =
                      TextSelection.fromPosition(
                    TextPosition(offset: string.length),
                  );
                },
                onEditingComplete: () {
                  bool valid = DecimalNumberSubmitValidator()
                      .isValid(_averageBalanceController.text);
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
                controller: _transaction1Controller,
                decoration: InputDecoration(prefixText: currency),
                focusNode: _focusNode2,
                inputFormatter: ValidatorInputFormatter(
                  editingValidator: DecimalNumberEditingRegexValidator(),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (string) {
                  string = '${_formatNumber(string.replaceAll(',', ''))}';
                  _transaction1Controller.text = string;
                  _transaction1Controller.selection =
                      TextSelection.fromPosition(
                    TextPosition(offset: string.length),
                  );
                },
                onEditingComplete: () {
                  bool valid = DecimalNumberSubmitValidator()
                      .isValid(_transaction1Controller.text);
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
                controller: _transaction2Controller,
                decoration: InputDecoration(prefixText: currency),
                focusNode: _focusNode3,
                inputFormatter: ValidatorInputFormatter(
                  editingValidator: DecimalNumberEditingRegexValidator(),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (string) {
                  string = '${_formatNumber(string.replaceAll(',', ''))}';
                  _transaction2Controller.text = string;
                  _transaction2Controller.selection =
                      TextSelection.fromPosition(
                    TextPosition(offset: string.length),
                  );
                },
                onEditingComplete: () {
                  bool valid = DecimalNumberSubmitValidator()
                      .isValid(_transaction2Controller.text);
                  valid
                      ? _focusNode3.unfocus()
                      : FocusScope.of(context).requestFocus(_focusNode3);
                },
                style: null,
                textAlign: TextAlign.start,
                validator: (val) =>
                    val.isEmpty ? 'Please enter a transaction' : null,
              ),
              Expanded(child: Container()),
              SubmitButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Account account = new Account(
                      balance: _averageBalanceController.text,
                      transactions: [
                        _transaction1Controller.text,
                        _transaction2Controller.text
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
