import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormattedInput extends StatelessWidget {
  FormattedInput({
    @required this.autoFocus,
    @required this.decoration,
    @required this.focusNode,
    @required this.initialValue,
    @required this.inputFormatter,
    @required this.keyboardType,
    @required this.onChanged,
    @required this.onEditingComplete,
    @required this.textAlign,
    this.validator,
    Key key,
  }) : super(key: key);

  final bool autoFocus;
  final InputDecoration decoration;
  final FocusNode focusNode;
  final String initialValue;
  final TextInputFormatter inputFormatter;
  final TextInputType keyboardType;
  final Function(String) onChanged;
  final Function() onEditingComplete;
  final TextAlign textAlign;
  final Function(String) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      autofocus: autoFocus,
      decoration: decoration,
      focusNode: focusNode,
      initialValue: initialValue,
      inputFormatters: [
        inputFormatter,
      ],
      keyboardType: keyboardType,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      textAlign: textAlign,
      textInputAction: TextInputAction.done,
      validator: validator,
    );
  }
}
