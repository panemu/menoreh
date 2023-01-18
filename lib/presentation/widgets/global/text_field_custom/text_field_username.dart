import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';

class TextFieldUsername extends StatelessWidget {
  final TextEditingController? controller;
  final String? title;
  final String hint;
  final bool enabled;
  final bool multiline;
  final String? initialValue;
  final TextInputAction? inputAction;
  final String? suffixText;
  final String? Function(String?)? validator;
  final bool obscure;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final int? maxLength;
  final String? errorText;

  const TextFieldUsername({
    Key? key,
    this.title,
    required this.hint,
    this.controller,
    this.enabled = true,
    this.multiline = false,
    this.initialValue,
    this.inputAction,
    this.suffixText,
    this.validator,
    this.obscure = false,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.errorText,
    this.maxLength = 225,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) Text(title!, textAlign: TextAlign.left, style: const TextStyle(color: AppColors.white)),
        if (title != null) SizedBox(height: AppDimens.size3S),
        Theme(
          data: Theme.of(context).copyWith(
            textSelectionTheme: TextSelectionThemeData(
              selectionColor: AppColors.white.withOpacity(0.5),
              cursorColor: AppColors.secondary,
            ),
          ),
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            initialValue: initialValue,
            keyboardType: TextInputType.text,
            style: const TextStyle(color: AppColors.white),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey.shade300, width: 1),
                borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.secondary, width: 1.5),
                borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.red, width: 1.5),
                borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.red, width: 1.5),
                borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
              ),
              errorStyle: const TextStyle(color: AppColors.red),
              alignLabelWithHint: true,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              hintText: hint,
              hintStyle: TextStyle(color: AppColors.grey.shade300),
              contentPadding: const EdgeInsets.all(AppDimens.paddingMedium),
              prefixIcon: Icon(Icons.person_outline_outlined, size: AppDimens.sizeL, color: AppColors.grey.shade200),
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
        ),
      ],
    );
  }
}
