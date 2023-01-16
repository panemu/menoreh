import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';

class TextFieldDatePicker extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hint;
  final bool enabled;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const TextFieldDatePicker({
    Key? key,
    required this.controller,
    required this.title,
    required this.hint,
    this.enabled = true,
    this.initialDate,
    this.firstDate,
    this.lastDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty) Text(title, textAlign: TextAlign.left),
        if (title.isNotEmpty) SizedBox(height: AppDimens.size3S),
        InkWell(
          borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
          onTap: () async {
            // check if click enabled
            if (enabled) {
              DateTime? date = await showDatePicker(
                context: context,
                initialDate: initialDate ?? DateTime.now(),
                firstDate: firstDate ?? DateTime(1945),
                lastDate: lastDate ?? DateTime.now(),
              );

              if (date != null) {
                controller.text = date.yMMMMd;
              }
            }
          },
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey.shade200, width: 1),
                borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey.shade200, width: 1),
                borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.secondary, width: 1.5),
                borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              floatingLabelStyle: const TextStyle(color: AppColors.grey),
              hintText: hint,
              contentPadding: const EdgeInsets.all(AppDimens.paddingMedium),
              prefixIcon: Icon(
                Icons.calendar_today,
                size: 18.0,
                color: AppColors.labelSecondary,
              ),
            ),
            enabled: false,
          ),
        ),
      ],
    );
  }
}
