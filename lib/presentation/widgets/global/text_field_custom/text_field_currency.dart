import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:menoreh_library/core/_core.dart';

class TextFieldCurrency extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hint;
  final bool enabled;
  final Function(String)? onChanged;
  final int? maxLength;

  const TextFieldCurrency({
    Key? key,
    required this.controller,
    required this.title,
    required this.hint,
    this.enabled = true,
    this.onChanged,
    this.maxLength = 225,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty) Text(title, textAlign: TextAlign.left),
        if (title.isNotEmpty) SizedBox(height: AppDimens.size3S),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  CurrencyTextInputFormatter(locale: 'id', decimalDigits: 0, symbol: ''),
                  LengthLimitingTextInputFormatter(maxLength),
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.grey.shade100, width: 1),
                    borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
                  ),
                  focusColor: AppColors.secondary,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.secondary, width: 1.5),
                    borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  floatingLabelStyle: TextStyle(color: AppColors.labelSecondary),
                  hintText: hint,
                  contentPadding: const EdgeInsets.all(AppDimens.paddingMedium),
                  prefixIcon: const _PrefixIconBuilder(),
                ),
                enabled: enabled,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _PrefixIconBuilder extends StatelessWidget {
  const _PrefixIconBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: AppDimens.paddingSmall),
      padding: const EdgeInsets.all(AppDimens.paddingMedium - 2),
      child: Text(
        'Rp',
        style: TextStyle(
          color: AppColors.labelSecondary,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
