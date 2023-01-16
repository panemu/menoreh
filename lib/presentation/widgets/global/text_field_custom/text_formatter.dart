import 'package:flutter/services.dart';
import 'package:menoreh_library/core/_core.dart';

class CapitalizeTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.capitalize,
      selection: newValue.selection,
    );
  }
}