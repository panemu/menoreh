import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';

class ListRowLink extends StatelessWidget {
  final String label;
  final String? value;
  final bool isLoaded;
  final double fontSize;
  final bool? boldLabel;
  final VoidCallback onClick;

  const ListRowLink({
    Key? key,
    required this.label,
    required this.onClick,
    this.value = 'Lihat',
    this.isLoaded = true,
    this.fontSize = 14,
    this.boldLabel = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            label,
            style: TextStyle(
              color: boldLabel! ? AppColors.labelPrimary : AppColors.labelSecondary,
              fontWeight: boldLabel! ? FontWeight.w600 : null,
              fontSize: boldLabel! ? AppDimens.size2M : 13,
            ),
          ),
        ),
        SizedBox(width: AppDimens.size3M),
        Expanded(
          flex: 3,
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: InkWell(
              onTap: onClick,
              child: Text(
                value!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppColors.blue,
                  fontSize: AppDimens.size2M,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
