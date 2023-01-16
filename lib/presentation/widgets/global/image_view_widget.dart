import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:photo_view/photo_view.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class ImageViewWidget extends StatelessWidget {
  final String imageUrl;
  final Size size;
  final double? radius;
  final String? defaultImage;

  const ImageViewWidget({
    super.key,
    required this.imageUrl,
    required this.size,
    this.radius,
    this.defaultImage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          constraints: BoxConstraints.expand(height: context.height),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            imageBuilder: (_, ImageProvider<Object> imageProvider) => PhotoView(
              imageProvider: imageProvider,
              basePosition: Alignment.center,
            ),
            fit: BoxFit.cover,
            placeholder: (_, url) => ShimmerCustom(size: size, radius: radius),
            errorWidget: (_, url, error) => PhotoView(
              imageProvider: AssetImage(defaultImage ?? AppImages.emptyAvatar),
              basePosition: Alignment.center,
            ),
          ),
        ),
        IconCloseButton(
          onPressed: () => context.router.pop(),
          color: AppColors.white,
        ),
      ],
    );
  }
}
