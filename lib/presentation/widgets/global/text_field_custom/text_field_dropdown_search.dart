import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';

class TextFieldDropdownSearch<T> extends StatelessWidget {
  final Key? dropdownKey;
  final String title;
  final List<T> items;
  final String Function(T)? itemAsString;
  final Function(T?)? onChanged;
  final bool Function(T selected, T? val)? compareFn;
  final T? selectedItem;
  final String? hint;
  final bool Function(T?)? itemDisabledFn;
  final String? Function(T?)? validator;

  const TextFieldDropdownSearch({
    Key? key,
    this.dropdownKey,
    required this.title,
    required this.items,
    this.itemAsString,
    this.onChanged,
    this.compareFn,
    this.itemDisabledFn,
    this.selectedItem,
    this.hint,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty) Text(title, textAlign: TextAlign.left),
        if (title.isNotEmpty) SizedBox(height: AppDimens.size3S),
        DropdownSearch<T>(
          key: dropdownKey,
          items: items,
          itemAsString: (item) => itemAsString!(item!),
          onChanged: onChanged,
          compareFn: (item, selectedItem) => compareFn!(item!, selectedItem),
          asyncItems: (text) => Future.value([]),
          selectedItem: selectedItem,
          validator: validator,
          autoValidateMode: AutovalidateMode.onUserInteraction,
          popupProps: PopupProps.menu(
            showSelectedItems: true,
            showSearchBox: true,
            disabledItemFn: itemDisabledFn,
            fit: FlexFit.loose,
            menuProps: MenuProps(
              borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
            ),
            searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                constraints: BoxConstraints(maxHeight: AppDimens.size2XL),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grey.shade300, width: 1),
                  borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grey.shade300, width: 1.5),
                  borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
                ),
                hintText: 'Cari sesuatu',
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: const TextStyle(fontSize: 16.0),
            dropdownSearchDecoration: InputDecoration(hintText: hint),
          ),
        ),
      ],
    );
  }
}
