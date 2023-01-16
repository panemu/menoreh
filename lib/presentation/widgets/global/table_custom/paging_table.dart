import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PagingTable extends StatelessWidget {
  final DataGridSource source;
  final double pageCount;

  const PagingTable({super.key, required this.pageCount, required this.source});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimens.pagingHeight,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingLarge),
        alignment: Alignment.center,
        child: SfDataPager(
          delegate: source,
          pageCount: pageCount,
        ),
      ),
    );
  }
}
