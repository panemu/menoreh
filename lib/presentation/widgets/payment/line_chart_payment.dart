import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:menoreh_library/core/_core.dart';

class LineChartLabaRugi extends StatelessWidget {
  final List<ChartLineModel> lstData;
  final bool loading;
  final double valMin;
  final double valMax;
  final double mnthMax;

  const LineChartLabaRugi({
    super.key,
    required this.lstData,
    required this.valMin,
    required this.valMax,
    required this.mnthMax,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppDimens.sizeL,
        left: AppDimens.sizeL,
        right: AppDimens.sizeL,
        bottom: AppDimens.size3L,
      ),
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(
            getTouchedSpotIndicator: (barData, spotIndexes) {
              return spotIndexes.map((spotIndex) {
                final spot = barData.spots[spotIndex];
                if (spot.x == 0 || spot.x == 6) {
                  return null;
                }
                return TouchedSpotIndicatorData(
                  FlLine(color: AppColors.divider, strokeWidth: 1),
                  FlDotData(
                    getDotPainter: (_, __, barData, ___) {
                      return FlDotCirclePainter(
                        color: barData.color,
                        strokeWidth: 0,
                        radius: 6,
                      );
                    },
                  ),
                );
              }).toList();
            },
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: AppColors.bgSecondary,
              fitInsideHorizontally: true,
              fitInsideVertically: true,
              getTooltipItems: (touchedSpots) {
                return touchedSpots.map((touchedSpot) {
                  String chart = '';

                  final TextStyle textStyle = TextStyle(
                    color: touchedSpot.bar.color,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  );

                  chart = touchedSpot.y.toString();

                  if (touchedSpot.y >= 1.0 && touchedSpot.y <= 12.0) {
                    chart = DateFormat('MMMM', "id").format(DateTime(0, touchedSpot.y.toInt()));
                  }

                  return LineTooltipItem(chart, textStyle);
                }).toList();
              },
            ),
            handleBuiltInTouches: true,
          ),
          gridData: FlGridData(
            show: true,
            horizontalInterval: ((valMax - valMin) / (12)).floorToDouble(),
            getDrawingHorizontalLine: (value) {
              return FlLine(color: AppColors.divider, strokeWidth: 0.6);
            },
          ),
          titlesData: FlTitlesData(
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                interval: ((valMax - valMin) / (4)).floorToDouble(),
                showTitles: true,
                reservedSize: AppDimens.sizeXL,
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: mnthMax / mnthMax,
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: const Border(
              left: BorderSide(color: AppColors.divider),
              bottom: BorderSide(color: AppColors.divider),
              top: BorderSide(color: AppColors.divider, width: 0.6),
            ),
          ),
          minX: 0,
          maxX: mnthMax == 0 || mnthMax == 0.0 ? 12 : mnthMax,
          maxY: valMax,
          minY: valMin,
          lineBarsData: lineBarDataMonthly(),
        ),
        swapAnimationDuration: const Duration(milliseconds: 250),
      ),
    );
  }

  List<LineChartBarData> lineBarDataMonthly() {
    List<FlSpot> chartData1 = [];
    List<FlSpot> chartData2 = [];
    List<FlSpot> chartData3 = [];
    for (int i = 0; i < lstData.length; i++) {
      chartData1.add(FlSpot(i.toDouble(), lstData[i].expense));
      chartData2.add(FlSpot(i.toDouble(), lstData[i].revenue));
      chartData3.add(FlSpot(i.toDouble(), lstData[i].profitOrLoss));
    }

    final LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: chartData1,
      isCurved: true,
      curveSmoothness: 0.1,
      color: AppColors.red,
      isStrokeCapRound: false,
      dotData: FlDotData(
        show: true,
        getDotPainter: (a, b, c, d) {
          return FlDotCirclePainter(strokeWidth: 0, color: AppColors.red);
        },
      ),
      belowBarData: BarAreaData(
        show: false,
        color: AppColors.red.withOpacity(0.2),
      ),
    );
    final LineChartBarData lineChartBarData2 = LineChartBarData(
      spots: chartData2,
      isCurved: true,
      curveSmoothness: 0.1,
      color: AppColors.success,
      isStrokeCapRound: false,
      dotData: FlDotData(
        show: true,
        getDotPainter: (a, b, c, d) {
          return FlDotCirclePainter(strokeWidth: 0, color: AppColors.success);
        },
      ),
      belowBarData: BarAreaData(
        show: false,
        color: AppColors.success.withOpacity(0.2),
      ),
    );
    final LineChartBarData lineChartBarData3 = LineChartBarData(
      spots: chartData3,
      isCurved: true,
      curveSmoothness: 0.1,
      color: AppColors.secondary,
      isStrokeCapRound: false,
      dotData: FlDotData(
        show: true,
        getDotPainter: (a, b, c, d) {
          return FlDotCirclePainter(strokeWidth: 0, color: AppColors.secondary);
        },
      ),
      belowBarData: BarAreaData(
        show: false,
        color: AppColors.secondary.withOpacity(0.2),
      ),
    );

    return [
      lineChartBarData1,
      lineChartBarData2,
      lineChartBarData3,
    ];
  }
}

// TODO : please create entity 
class ChartLineModel {
  final int bulan;
  final double expense;
  final double profitOrLoss;
  final double revenue;
  final int tahun;

  ChartLineModel({
    required this.bulan,
    required this.expense,
    required this.profitOrLoss,
    required this.revenue,
    required this.tahun,
  });
}
