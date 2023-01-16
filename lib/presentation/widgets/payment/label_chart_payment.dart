import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';

class LabelChartPayment extends StatelessWidget {
  final List<LabelValue> listLabel;

  const LabelChartPayment({super.key, required this.listLabel});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: listLabel.map((e) => _DotLabel(value: e)).toList(),
    );
  }
}

class _DotLabel extends StatelessWidget {
  final LabelValue value;

  const _DotLabel({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingMedium),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: AppDimens.sizeM,
            height: AppDimens.sizeM,
            decoration: BoxDecoration(
              color: value.color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: AppDimens.paddingSmallX),
          Text(value.title),
        ],
      ),
    );
  }
}

class LabelValue {
  final String title;
  final Color color;

  LabelValue({
    required this.title,
    required this.color,
  });
}
