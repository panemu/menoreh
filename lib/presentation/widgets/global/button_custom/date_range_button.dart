import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';

/// ```
/// SizedBox(
///   width: 200,
///   child: DateRangeButton<String>(
///     items: const ['Minggu ini', 'Bulan ini', 'Tahun ini'],
///     onChanged: (value) {},
///     selectedItem: 'Bulan ini',
///   ),
/// ),
/// ```
class DateRangeButton<T> extends StatelessWidget {
  final Key? dropdownKey;
  final List<T> items;
  final T? selectedItem;
  final Function(T?)? onChanged;

  const DateRangeButton({
    super.key,
    this.dropdownKey,
    required this.items,
    required this.onChanged,
    required this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
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
            fillColor: AppColors.secondary,
            prefixIconColor: AppColors.secondary,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey.shade100, width: 1),
              borderRadius: BorderRadius.circular(AppDimens.sizeXL),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.secondary, width: 1.5),
              borderRadius: BorderRadius.circular(AppDimens.sizeXL),
            ),
            alignLabelWithHint: true,
            suffixIconColor: AppColors.secondary,
            iconColor: AppColors.secondary,
            prefixIcon: const Icon(Icons.date_range),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            floatingLabelStyle: TextStyle(color: AppColors.labelSecondary),
            isDense: true,
          ),
        ),
        onChanged: onChanged,
        selectedItem: selectedItem,
      ),
    );
  }
}
