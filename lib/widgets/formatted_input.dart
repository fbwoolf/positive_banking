import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormattedInput extends StatelessWidget {
  FormattedInput({
    @required this.decoration,
    @required this.focusNode,
    @required this.inputFormatter,
    @required this.keyboardType,
    @required this.onChanged,
    @required this.onEditingComplete,
    @required this.style,
    @required this.textAlign,
    Key key,
  }) : super(key: key);

  final InputDecoration decoration;
  final FocusNode focusNode;
  final TextInputFormatter inputFormatter;
  final TextInputType keyboardType;
  final Function(String) onChanged;
  final Function() onEditingComplete;
  final TextStyle style;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      decoration: decoration,
      focusNode: focusNode,
      inputFormatters: [
        inputFormatter,
      ],
      keyboardType: keyboardType,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      style: style,
      textAlign: textAlign,
      textInputAction: TextInputAction.done,
    );
  }
}
