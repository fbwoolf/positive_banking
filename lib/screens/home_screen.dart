import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();

  // Local state
  double _avgBalance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Positive Banking'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Text(
              'Make a Good transaction',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              initialValue: '00.00',
              decoration: InputDecoration(),
              validator: (val) =>
                  val.isEmpty ? 'Please enter an average balance' : null,
              onChanged: (val) =>
                  setState(() => _avgBalance = double.parse(val)),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
              ],
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
