import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PagingTable extends StatelessWidget {
  final DataGridSource source;
  final double pageCount;

  const PagingTable({super.key, required this.pageCount, required this.source});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppDimens.paddingLarge, right: AppDimens.paddingSmall),
      child: SfDataPager(
        delegate: source,
        pageCount: pageCount,
      ),
    );
  }
}
