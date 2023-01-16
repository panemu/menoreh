import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:menoreh_library/core/_core.dart';

class TextFieldBasic extends StatelessWidget {
  final TextEditingController? controller;
  final String? title;
  final String hint;
  final bool enabled;
  final bool multiline;
  final String? initialValue;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final String? suffixText;
  final String? Function(String?)? validator;
  final bool obscure;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final int? maxLength;
  final String? errorText;
  final Color? colorTitle;
  final TextStyle? style;
  final InputDecoration? decoration;
  final List<TextInputFormatter>? inputFormatters;

  const TextFieldBasic({
    Key? key,
    this.title,
    required this.hint,
    this.controller,
    this.enabled = true,
    this.multiline = false,
    this.initialValue,
    this.inputType,
    this.inputAction,
    this.suffixText,
    this.validator,
    this.obscure = false,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.errorText,
    this.colorTitle,
    this.decoration,
    this.style,
    this.inputFormatters,
    this.maxLength = 225,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(title!, textAlign: TextAlign.left, style: TextStyle(color: colorTitle ?? AppColors.labelPrimary)),
        if (title != null) SizedBox(height: AppDimens.size3S),
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          initialValue: initialValue,
          keyboardType: inputType,
          style: style,
          decoration: decoration ??
              InputDecoration(
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grey.shade50, width: 1),
                  borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grey.shade100, width: 1),
                  borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.secondary, width: 1.5),
                  borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
                ),
                alignLabelWithHint: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                hintText: hint,
                contentPadding: const EdgeInsets.all(AppDimens.paddingMedium),
                suffixText: suffixText,
                errorText: errorText,
              ),
          enabled: enabled,
          maxLines: multiline ? 4 : 1,
          textInputAction: inputAction,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: obscure,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          inputFormatters: inputFormatters ??
              (inputType == TextInputType.number
                  ? [
                      CurrencyTextInputFormatter(locale: 'id', decimalDigits: 0, symbol: ''),
                      LengthLimitingTextInputFormatter(maxLength),
                    ]
                  : [
                      LengthLimitingTextInputFormatter(maxLength),
                    ]),
        ),
      ],
    );
  }
}
