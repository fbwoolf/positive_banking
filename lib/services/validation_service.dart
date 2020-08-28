import 'package:flutter/services.dart';

abstract class StringValidator {
  bool isValid(String value);
}

class RegexValidator implements StringValidator {
  RegexValidator({this.regexSource});
  final String regexSource;

  bool isValid(String value) {
    try {
      final regex = RegExp(regexSource);
      final matches = regex.allMatches(value);
      for (Match match in matches) {
        if (match.start == 0 && match.end == value.length) {
          return true;
        }
      }
      return false;
    } catch (e) {
      assert(false, e.toString());
      return false;
    }
  }
}

class ValidatorInputFormatter implements TextInputFormatter {
  ValidatorInputFormatter({
    this.editingValidator,
  });

  final StringValidator editingValidator;

  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final oldValueValid = editingValidator.isValid(oldValue.text);
    final newValueValid = editingValidator.isValid(newValue.text);
    if (oldValueValid && !newValueValid) {
      return oldValue;
    }
    return newValue;
  }
}

class DecimalNumberEditingRegexValidator extends RegexValidator {
  DecimalNumberEditingRegexValidator()
      : super(
            regexSource:
                "^\$|^(0|[0-9,]{0,3}(?:,?[0-9,]{1,3}))*(\.[0-9]{0,2})?\$");
}

class DecimalNumberSubmitValidator implements StringValidator {
  @override
  bool isValid(String value) {
    try {
      final number = double.parse(value);
      return number > 0.0;
    } catch (e) {
      return false;
    }
  }
}
