import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';

class ListRowHighline extends StatelessWidget {
  final String label;
  final List<ListRowHighlineValue> listValue;
  final bool isLoaded;
  final double fontSize;
  final bool? boldLabel;
  final VoidCallback onAdd;

  const ListRowHighline({
    Key? key,
    required this.label,
    required this.listValue,
    required this.onAdd,
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
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
            child: Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: AppDimens.size3S,
              children: [
                for (var i = 0; i < listValue.length; i++)
                  ListRowHighlineValue(
                    onClick: listValue[i].onClick,
                    value: listValue[i].value,
                    isLast: (i + 1 == listValue.length),
                  ),
                IconButton(
                  onPressed: onAdd,
                  icon: const Icon(Icons.add_circle_outlined),
                  color: AppColors.secondary,
                  splashRadius: AppDimens.sizeM,
                  iconSize: AppDimens.size4M,
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(
                    minWidth: AppDimens.sizeL,
                    minHeight: AppDimens.sizeL,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ListRowHighlineValue extends StatelessWidget {
  final VoidCallback onClick;
  final String value;
  final bool? isLast;

  const ListRowHighlineValue({
    Key? key,
    required this.onClick,
    required this.value,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Text(
        (isLast!) ? value : '$value,',
        maxLines: 1,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: AppColors.blue,
          fontSize: AppDimens.size2M,
          overflow: TextOverflow.ellipsis,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
