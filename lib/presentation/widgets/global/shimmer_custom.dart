import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCustom extends StatelessWidget {
  final Size size;
  final double? radius;

  const ShimmerCustom({Key? key, required this.size, this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey.shade300,
      highlightColor: AppColors.grey.shade100,
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? AppDimens.radiusLargeX),
          color: AppColors.grey.shade300
        ),
      ),
    );
  }
}
