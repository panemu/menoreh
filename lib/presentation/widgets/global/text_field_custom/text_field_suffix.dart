import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:menoreh_library/core/_core.dart';

class TextFieldSuffix extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hint;
  final bool enabled;
  final TextInputType? inputType;
  final SuffixType type;
  final Function()? onClick;

  const TextFieldSuffix({
    Key? key,
    required this.controller,
    required this.title,
    required this.hint,
    this.enabled = true,
    this.inputType,
    required this.type,
    this.onClick,
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
                keyboardType: type.isPercentage ? TextInputType.number : inputType,
                inputFormatters: [
                  if (type.isPercentage) FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.grey.shade100, width: 1),
                    borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.secondary, width: 1.5),
                    borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
                  ),
                  alignLabelWithHint: true,
                  hintText: hint,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  contentPadding: const EdgeInsets.all(AppDimens.paddingMedium),
                  suffixIcon: type.isPercentage ? const _PercentageBuilder() : null,
                ),
                enabled: enabled,
              ),
            ),
            _SuffixBuilder(onClick: onClick, type: type),
          ],
        ),
      ],
    );
  }
}

class _SuffixBuilder extends StatelessWidget {
  final Function()? onClick;
  final SuffixType type;

  const _SuffixBuilder({Key? key, required this.onClick, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (type.isChackButton) {
      return InkWell(
        onTap: onClick,
        child: Container(
          margin: const EdgeInsets.only(left: AppDimens.paddingSmall),
          padding: const EdgeInsets.all(AppDimens.paddingMedium - 2),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(AppDimens.radiusSmall),
          ),
          child: const Text(
            'Check',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}

class _PercentageBuilder extends StatelessWidget {
  const _PercentageBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: AppDimens.paddingSmall),
      padding: const EdgeInsets.all(AppDimens.paddingMedium - 2),
      child: Text(
        '%',
        style: TextStyle(
          color: AppColors.labelSecondary,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
