import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';

class BadgeNotification extends StatelessWidget {
  final String label;
  final Widget icon;
  final BadgeType typeBadge;
  final bool isActive;

  const BadgeNotification({
    Key? key,
    required this.icon,
    this.label = '',
    this.isActive = false,
    this.typeBadge = BadgeType.dot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        icon,
        typeBadge.isDot
            ? isActive
                ? Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.red,
                      ),
                      height: AppDimens.size3S,
                      width: AppDimens.size3S,
                    ),
                  )
                : const SizedBox()
            : label.isNotEmpty
                ? Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.red),
                      alignment: Alignment.center,
                      child: Text(label, style: const TextStyle(color: AppColors.white, fontSize: 9.0)),
                    ),
                  )
                : const SizedBox(),
      ],
    );
  }
}
