import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';

class TextFieldAuth extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String title;
  final String hint;
  final bool enabled;
  final bool multiline;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final String? suffixText;
  final String? Function(String?)? validator;
  final bool obscure;
  final Widget? suffix;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  const TextFieldAuth({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.title,
    required this.hint,
    this.enabled = true,
    this.multiline = false,
    this.inputType,
    this.inputAction,
    this.suffixText,
    this.validator,
    this.obscure = false,
    this.suffix,
    this.onChanged,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty) Text(title, textAlign: TextAlign.left),
        if (title.isNotEmpty) SizedBox(height: AppDimens.size3S),
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          keyboardType: inputType,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey.shade100, width: 1.0),
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
            suffixIcon: suffix,
          ),
          enabled: enabled,
          maxLines: multiline ? 4 : 1,
          textInputAction: inputAction,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: obscure,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
        ),
      ],
    );
  }
}
