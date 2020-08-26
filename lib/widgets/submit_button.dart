import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  SubmitButton({
    @required this.onPressed,
    @required this.submitText,
    @required this.valid,
    Key key,
  }) : super(key: key);

  final Function() onPressed;
  final String submitText;
  final bool valid;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: valid ? 1.0 : 0.0,
      child: Container(
        constraints: BoxConstraints.expand(
          width: double.infinity,
          height: 60.0,
        ),
        child: FlatButton(
          color: Colors.green[400],
          child: Text(
            submitText,
            style: TextStyle(fontSize: 20.0),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
