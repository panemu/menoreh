import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class SidebarBodyCard extends StatelessWidget {
  final List<ContentSidebarBodyCard> contents;

  const SidebarBodyCard({super.key, required this.contents});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.isPhone
          ? const EdgeInsets.symmetric(horizontal: AppDimens.paddingMediumX, vertical: AppDimens.paddingMediumX)
          : const EdgeInsets.symmetric(horizontal: AppDimens.paddingLargeX, vertical: AppDimens.paddingMediumX),
      child: SizedBox(
        height: AppDimens.maxHeightCard,
        child: context.responsiveValue<Widget>(
          desktop: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var i = 0; i < contents.length; i++)
                Expanded(
                  child: Container(
                    margin: contents.length == i + 1
                        ? EdgeInsets.zero
                        : const EdgeInsets.only(right: AppDimens.paddingLarge),
                    child: _ContentBuilder(content: contents, index: i),
                  ),
                ),
            ],
          ),
          mobile: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: contents.length,
            itemBuilder: (_, index) => Container(
                constraints: BoxConstraints(
                  minWidth: context.responsiveValue<double>(
                    desktop: (context.width / contents.length) - (27 + (contents.length % 3 == 0 ? 3 : 0)),
                    tablet: (context.width / contents.length) - (27 + (contents.length % 3 == 0 ? 3 : 0)),
                    mobile: AppDimens.widthCard,
                  ),
                ),
                child: _ContentBuilder(content: contents, index: index)),
            separatorBuilder: (_, __) => const SizedBox(width: AppDimens.paddingLarge),
          ),
        ),
      ),
    );
  }
}

class _ContentBuilder extends StatelessWidget {
  final int index;
  final List<ContentSidebarBodyCard> content;

  const _ContentBuilder({required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingLarge),
      decoration: BoxDecoration(
        color: AppColors.grey.shade100,
        borderRadius: BorderRadius.circular(AppDimens.radiusLargeX),
        boxShadow: [AppShadows.card],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (content[index].isLoading!)
            ShimmerCustom(size: Size(AppDimens.size4L, AppDimens.size4L), radius: AppDimens.radiusMediumX)
          else
            Icon(
              content[index].icon,
              color: AppColors.secondary,
              size: AppDimens.size4L,
            ),
          SizedBox(width: AppDimens.sizeM),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (content[index].isLoading!)
                ShimmerCustom(size: Size(AppDimens.size8X, AppDimens.size2M))
              else
                Text(content[index].title, style: AppTextStyle.cardTitle),
              SizedBox(height: AppDimens.sizeS),
              if (content[index].isLoading!)
                ShimmerCustom(size: Size(AppDimens.sizeXL, AppDimens.size3M))
              else
                SelectableText(
                  content[index].value.isNotEmpty ? content[index].value : '-',
                  style: AppTextStyle.cardValue,
                ),
            ],
          )
        ],
      ),
    );
  }
}

class ContentSidebarBodyCard {
  final IconData icon;
  final String title;
  final String value;
  final bool? isLoading;
  final VoidCallback? onTap;

  ContentSidebarBodyCard({
    required this.icon,
    required this.title,
    required this.value,
    this.isLoading = false,
    this.onTap,
  });
}
