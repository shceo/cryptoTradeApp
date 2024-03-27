import 'package:crypto_trader/blocs/crypto_history_bloc/bloc/crypto_history_bloc_bloc.dart';
import 'package:crypto_trader/ui/theme/crypto_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoLine extends StatelessWidget {
  const CryptoLine({
    Key? key,
    required this.name,
    this.touch = true,
  }) : super(key: key);

  final String name;
  final bool touch;

  @override
  Widget build(BuildContext context) {
    context.read<CryptoHistoryBlocBloc>().add(
          CryptoHistoryBlocIntervalEvent(name: name, interval: 'm5'),
        );

    return BlocBuilder<CryptoHistoryBlocBloc, CryptoHistoryBlocState>(
      builder: (context, state) {
        if (state is CryptoHistoryBlocIsLoaded) {
          final historyList = state.cryptoHistoryList;

          if (historyList.isEmpty) {
            return Center(child: Text('Нет данных'));
          }

          final minY = historyList.map((e) => e.price).reduce((a, b) => a < b ? a : b);
          final maxY = historyList.map((e) => e.price).reduce((a, b) => a > b ? a : b);

          return LineChart(
            LineChartData(
              minX: historyList.first.time.toDouble(),
              maxX: historyList.last.time.toDouble(),
              minY: minY,
              maxY: maxY,
              lineTouchData: LineTouchData(enabled: touch),
              titlesData: FlTitlesData(show: false),
              gridData: FlGridData(show: true, drawVerticalLine: false, drawHorizontalLine: false),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: historyList.map((e) => FlSpot(e.time.toDouble(), e.price)).toList(),
                  color: historyList.first.price <= historyList.last.price ? CryptoColors.graphGreen :CryptoColors.graphRed,
                  barWidth: 3,
                  dotData: FlDotData(show: false),
                  belowBarData: BarAreaData(show: false),
                ),
              ],
            ),
            curve: Curves.linear,
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
