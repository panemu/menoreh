import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';

class TextFieldDropdown<T> extends StatelessWidget {
  final String? title;
  final String? hint;
  final Key? dropdownKey;
  final List<T> items;
  final T? selectedItem;
  final Function(T?)? onChanged;

  const TextFieldDropdown({
    super.key,
    this.dropdownKey,
    this.title,
    required this.items,
    this.onChanged,
    this.selectedItem,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) Text(title!, textAlign: TextAlign.left),
        if (title != null) SizedBox(height: AppDimens.size3S),
        Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          child: DropdownSearch<T>(
            key: dropdownKey,
            popupProps: PopupProps.menu(
              showSearchBox: false,
              fit: FlexFit.loose,
              menuProps: MenuProps(
                borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
              ),
            ),
            items: items,
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grey.shade100, width: 1),
                  borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.secondary, width: 1.5),
                  borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
                ),
                hintText: hint,
                alignLabelWithHint: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                floatingLabelStyle: TextStyle(color: AppColors.labelSecondary),
                contentPadding: const EdgeInsets.only(left: AppDimens.paddingMedium),
              ),
            ),
            onChanged: onChanged,
            selectedItem: selectedItem,
          ),
        ),
      ],
    );
  }
}
