import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:positive_banking/routes.dart';
import 'package:positive_banking/services/services.dart';
import 'package:positive_banking/shared/shared.dart';
import 'package:positive_banking/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();
  final _formKey = GlobalKey<FormState>();

  bool _autoValidate = false;
  String _averageBalance = '';
  String _transaction1 = '';
  String _transaction2 = '';

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
          child: Column(
            children: <Widget>[
              Text(
                'Make a Good transaction',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 20.0),
              FormattedInput(
                autoFocus: true,
                decoration: inputDecoration.copyWith(
                  hintText: '0.00',
                  prefixText: '\$',
                ),
                focusNode: _focusNode1,
                inputFormatter: ValidatorInputFormatter(
                  editingValidator: DecimalNumberEditingRegexValidator(),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (val) => setState(() => _averageBalance = val),
                onEditingComplete: () {
                  bool valid =
                      DecimalNumberSubmitValidator().isValid(_averageBalance);
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
                decoration: inputDecoration.copyWith(
                  hintText: '0.00',
                  prefixText: '\$',
                ),
                focusNode: _focusNode2,
                inputFormatter: ValidatorInputFormatter(
                  editingValidator: DecimalNumberEditingRegexValidator(),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (val) => setState(() => _transaction1 = val),
                onEditingComplete: () {
                  bool valid =
                      DecimalNumberSubmitValidator().isValid(_transaction1);
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
                decoration: inputDecoration.copyWith(
                  hintText: '0.00',
                  prefixText: '\$',
                ),
                focusNode: _focusNode3,
                inputFormatter: ValidatorInputFormatter(
                  editingValidator: DecimalNumberEditingRegexValidator(),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (val) => setState(() => _transaction2 = val),
                onEditingComplete: () {
                  bool valid =
                      DecimalNumberSubmitValidator().isValid(_transaction2);
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
                    Navigator.pushReplacementNamed(context, detailsRoute);
                  } else {
                    _autoValidate = true;
                  }
                },
                submitText: 'Submit',
                valid: _averageBalance.isNotEmpty &&
                    _transaction1.isNotEmpty &&
                    _transaction2.isNotEmpty,
              )
            ],
          ),
        ),
      ),
    );
  }
}
