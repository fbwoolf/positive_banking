import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormattedInput extends StatelessWidget {
  FormattedInput({
    @required this.autoFocus,
    @required this.controller,
    @required this.decoration,
    @required this.focusNode,
    @required this.inputFormatter,
    @required this.keyboardType,
    @required this.onChanged,
    @required this.onEditingComplete,
    @required this.style,
    @required this.textAlign,
    @required this.validator,
    Key key,
  }) : super(key: key);

  final bool autoFocus;
  final TextEditingController controller;
  final InputDecoration decoration;
  final FocusNode focusNode;
  final TextInputFormatter inputFormatter;
  final TextInputType keyboardType;
  final Function(String) onChanged;
  final Function() onEditingComplete;
  final TextStyle style;
  final TextAlign textAlign;
  final Function(String) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      autofocus: autoFocus,
      controller: controller,
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
      validator: validator,
    );
  }
}
