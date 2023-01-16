import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class CacheImageWidget extends StatelessWidget {
  final String imageUrl;
  final Size size;
  final double? radius;
  final String? defaultImage;
  final bool? disbleTap;

  const CacheImageWidget({
    super.key,
    required this.imageUrl,
    required this.size,
    this.radius,
    this.defaultImage,
    this.disbleTap = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(radius ?? AppDimens.radiusLargeX),
      onTap: disbleTap!
          ? null
          : () => showDialog(
                context: context,
                builder: (context) => ImageViewWidget(imageUrl: imageUrl, size: size),
              ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) => Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? AppDimens.radiusLargeX),
            border: Border.all(color: AppColors.white, width: 2.0),
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
        fit: BoxFit.cover,
        placeholder: (_, url) => ShimmerCustom(size: size, radius: radius),
        errorWidget: (_, url, error) => Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? AppDimens.radiusLargeX),
            border: Border.all(color: AppColors.white, width: 2.0),
            image: DecorationImage(
              image: AssetImage(defaultImage ?? AppImages.emptyAvatar),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
