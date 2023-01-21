import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class SidebarBodyAction extends StatelessWidget {
  final String? title;

  /// hit of search is `Cari sesuatu`
  final String? searchHint;
  final void Function(String value)? onSearch;
  final Widget? dropdownButton;
  final VoidCallback? onFilter;
  final VoidCallback? onAdd;
  final VoidCallback? onExport;
  final VoidCallback? onImport;

  const SidebarBodyAction({
    super.key,
    this.title,
    this.onSearch,
    this.onFilter,
    this.searchHint = 'Cari sesuatu',
    this.dropdownButton,
    this.onAdd,
    this.onExport,
    this.onImport,
  });

  @override
  Widget build(BuildContext context) {
    late List<Widget> listLeft = [];
    late List<Widget> listRight = [];

    //! LEFT Tablet Under
    if (context.isTabletUnder) {
      //! title
      if (title != null) {
        listLeft.add(
          Text(title!, style: AppTextStyle.tableTitle),
        );
      }

      //! search
      if (onSearch != null) {
        listLeft.add(
          Expanded(
            child: TextFieldSearch(
              onChanged: onSearch,
              hint: searchHint!,
            ),
          ),
        );
      }

      if (dropdownButton != null) {
        listLeft.addAll([
          const SizedBox(width: AppDimens.paddingMedium),
          SizedBox(
            width: AppDimens.size8X * 2,
            child: dropdownButton!,
          ),
        ]);
      }

      //! fliter
      if (onFilter != null) {
        listLeft.add(const SizedBox(width: AppDimens.paddingMedium));
        listLeft.add(
          OutlinedButtonIcon(
            onPressed: () {
              SmartDialog.showAttach(
                targetContext: context,
                usePenetrate: true,
                keepSingle: true,
                alignment: Alignment.bottomRight,
                clickMaskDismiss: true,
                useAnimation: false,
                debounce: true,
                targetBuilder: (targetOffset, targetSize) => Offset(targetOffset.dx - 100, targetOffset.dy - 24),
                builder: (_) => _PopupMenu(onImport: onImport, onExport: onExport, onFilter: onFilter!),
              );
            },
            icon: const Icon(Icons.more_vert_outlined),
            tooltip: 'Lainnya',
          ),
        );
      }

      //! btn add
      if (onAdd != null) {
        listLeft.add(const SizedBox(width: AppDimens.paddingMedium));
        listLeft.add(
          ElevatedButtonIcon(
            onPressed: onAdd,
            backgroundColor: AppColors.secondary,
            icon: const Icon(Icons.add_circle_outline),
            tooltip: 'Add data',
          ),
        );
      }
    } else {
      //! LEFT & RIGHT DESKTOP
      //! title
      if (title != null) {
        listLeft.add(
          Text(title!, style: AppTextStyle.tableTitle),
        );
      }

      //! search
      if (onSearch != null) {
        listLeft.addAll([
          SizedBox(
            width: context.isLargeTablet ? AppDimens.fieldSearch : AppDimens.fieldSearchTablet,
            child: TextFieldSearch(
              onChanged: onSearch,
              hint: searchHint!,
            ),
          ),
        ]);
      }

      //! filter
      if (onFilter != null) {
        listLeft.addAll([
          const SizedBox(width: AppDimens.paddingMedium),
          OutlinedButtonIcon(
            onPressed: onFilter,
            icon: const Icon(Icons.filter_list),
            tooltip: 'Filter',
          ),
        ]);
      }

      //! tbn dropdown
      if (dropdownButton != null) {
        listRight.addAll([
          SizedBox(
            width: AppDimens.size8X * 2,
            child: dropdownButton!,
          ),
        ]);
      }

      //! btn add
      if (onAdd != null) {
        listRight.add(
          ElevatedButton.icon(
            onPressed: onAdd,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondary,
            ),
            icon: const Icon(Icons.add_circle_outline),
            label: const Text('Tambah'),
          ),
        );
      }

      //! btn import
      if (onImport != null) {
        listRight.add(const SizedBox(width: AppDimens.paddingMedium));
        listRight.add(
          ElevatedButtonIcon(
            onPressed: onImport!,
            backgroundColor: AppColors.orange,
            icon: const Icon(Icons.upload_file_outlined),
            tooltip: 'Import',
          ),
        );
      }

      //! btn export
      if (onExport != null) {
        listRight.add(const SizedBox(width: AppDimens.paddingMedium));
        listRight.add(
          ElevatedButtonIcon(
            onPressed: onExport!,
            backgroundColor: AppColors.green,
            icon: const Icon(Icons.file_download_outlined),
            tooltip: 'Export',
          ),
        );
      }
    }

    return Padding(
      padding: context.isTabletUnder
          ? const EdgeInsets.symmetric(horizontal: AppDimens.paddingMediumX, vertical: AppDimens.paddingMediumX)
          : const EdgeInsets.symmetric(horizontal: AppDimens.paddingLargeX, vertical: AppDimens.paddingMediumX),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: context.isTabletUnder
                ? listLeft
                : [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: listLeft,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: listRight,
                    ),
                  ],
          ),
        ],
      ),
    );
  }
}

class _PopupMenu extends StatelessWidget {
  const _PopupMenu({
    Key? key,
    required this.onImport,
    required this.onExport,
    required this.onFilter,
  }) : super(key: key);

  final VoidCallback? onImport;
  final VoidCallback? onExport;
  final VoidCallback onFilter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.paddingLarge),
      child: Container(
        width: AppDimens.size8X * 2,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppDimens.radiusLarge),
          boxShadow: [AppShadows.button],
        ),
        child: Column(
          children: [
            if (onImport != null)
              ListTile(
                onTap: () {
                  onImport!.call();
                  SmartDialog.dismiss();
                },
                minLeadingWidth: AppDimens.paddingSmallX,
                leading: const Icon(Icons.upload_file_outlined),
                title: const Text('Import'),
              ),
            if (onExport != null)
              ListTile(
                onTap: () {
                  onExport!.call();
                  SmartDialog.dismiss();
                },
                minLeadingWidth: AppDimens.paddingSmallX,
                leading: const Icon(Icons.file_download_outlined),
                title: const Text('Export'),
              ),
            ListTile(
              onTap: () {
                onFilter.call();
                SmartDialog.dismiss();
              },
              minLeadingWidth: AppDimens.paddingSmallX,
              leading: const Icon(Icons.filter_list),
              title: const Text('Filter'),
            ),
          ],
        ),
      ),
    );
  }
}
