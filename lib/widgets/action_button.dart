import 'package:flutter/material.dart';
import 'package:positive_banking/shared/custom_color.dart';

class ActionButton extends StatelessWidget {
  ActionButton({
    @required this.onPressed,
    @required this.submitText,
    Key key,
  }) : super(key: key);

  final Function() onPressed;
  final String submitText;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        width: double.infinity,
        height: 60.0,
      ),
      child: FlatButton(
        color: goodMoneyColor,
        child: Text(
          submitText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        onPressed: onPressed,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
