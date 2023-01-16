import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class ReportPaymentTab extends StatelessWidget {
  const ReportPaymentTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SidebarBodyCard(
          contents: [
            ContentSidebarBodyCard(
              icon: Icons.payments_outlined,
              title: 'Total Pendapatan',
              value: '40.000',
            ),
            ContentSidebarBodyCard(
              icon: Icons.timeline_outlined,
              title: 'Rata-rata Pendapatan',
              value: '40.000',
            ),
            ContentSidebarBodyCard(
              icon: Icons.arrow_circle_up_outlined,
              title: 'Pembayaran Tertinggi',
              value: '40.000',
            ),
          ],
        ),
        Divider(height: AppDimens.sizeZero),
        SidebarBodyAction(
          title: 'Report Pembelian',
          dropdownButton: DateRangeButton<String>(
            items: const ['Mingguan', 'Bulanan', 'Tahunan'],
            onChanged: (value) {},
            selectedItem: 'Bulanan',
          ),
        ),
        LabelChartPayment(
          listLabel: [
            LabelValue(title: 'Kencan', color: AppColors.green),
            LabelValue(title: 'Teman', color: AppColors.orange),
            LabelValue(title: 'Nongkrong', color: AppColors.blue),
            LabelValue(title: 'Keluarga', color: AppColors.red),
          ],
        ),
        Expanded(
          child: LineChartLabaRugi(
            lstData: [
              ChartLineModel(
                bulan: 2,
                expense: 12000,
                profitOrLoss: 40000,
                revenue: 20000,
                tahun: 2021,
              ),
              ChartLineModel(
                bulan: 3,
                expense: 2000,
                profitOrLoss: 50000,
                revenue: 40000,
                tahun: 2021,
              ),
              ChartLineModel(
                bulan: 4,
                expense: 22000,
                profitOrLoss: 76000,
                revenue: 15000,
                tahun: 2021,
              ),
              ChartLineModel(
                bulan: 5,
                expense: 9000,
                profitOrLoss: 80000,
                revenue: 65000,
                tahun: 2021,
              ),
            ],
            loading: false,
            mnthMax: 3,
            valMax: 80000,
            valMin: 0,
          ),
        )
      ],
    );
  }
}
