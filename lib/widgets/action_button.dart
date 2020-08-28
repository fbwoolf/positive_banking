import 'package:flutter/material.dart';
import 'package:positive_banking/shared/custom_color.dart';

class ActionButton extends StatelessWidget {
  ActionButton({
    @required this.enabled,
    @required this.onPressed,
    @required this.submitText,
    Key key,
  }) : super(key: key);

  final bool enabled;
  final Function() onPressed;
  final String submitText;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1.0 : 0.0,
      child: Container(
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
          onPressed: enabled ? onPressed : null,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
