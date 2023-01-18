import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';

class TextFieldPassword extends StatefulWidget {
  final TextEditingController? controller;
  final String? title;
  final String hint;
  final bool enabled;
  final bool multiline;
  final String? initialValue;
  final TextInputAction? inputAction;
  final String? suffixText;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final int? maxLength;
  final String? errorText;

  const TextFieldPassword({
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
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.errorText,
    this.maxLength = 225,
  }) : super(key: key);

  @override
  State<TextFieldPassword> createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Text(widget.title!, textAlign: TextAlign.left, style: const TextStyle(color: AppColors.white)),
        if (widget.title != null) SizedBox(height: AppDimens.size3S),
        Theme(
          data: Theme.of(context).copyWith(
            textSelectionTheme: TextSelectionThemeData(
              selectionColor: AppColors.white.withOpacity(0.5),
              cursorColor: AppColors.secondary,
            ),
          ),
          child: TextFormField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            initialValue: widget.initialValue,
            keyboardType: TextInputType.visiblePassword,
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
              alignLabelWithHint: true,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              hintText: widget.hint,
              hintStyle: TextStyle(color: AppColors.grey.shade300),
              contentPadding: const EdgeInsets.all(AppDimens.paddingMedium),
              prefixIcon: Icon(Icons.lock_outline_rounded, size: AppDimens.sizeL, color: AppColors.grey.shade200),
              suffixIcon: IconButton(
                onPressed: () => setState(() => _isVisible = !_isVisible),
                icon: Icon(_isVisible ? Icons.visibility : Icons.visibility_off_outlined),
                color: AppColors.grey.shade200,
              ),
            ),
            enabled: widget.enabled,
            maxLines: widget.multiline ? 4 : 1,
            textInputAction: widget.inputAction,
            validator: widget.validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: _isVisible,
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onSubmitted,
          ),
        ),
      ],
    );
  }
}
