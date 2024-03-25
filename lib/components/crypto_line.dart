import 'package:crypto_trader/blocs/crypto_history_bloc/bloc/crypto_history_bloc_bloc.dart';
import 'package:crypto_trader/domain/models/crypto_history.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoLine extends StatelessWidget {
  const CryptoLine({super.key , required this.name,this.touch = true});
  final String name;
  final bool touch;
  @override
  Widget build(BuildContext context) {
    context
        .read<CryptoHistoryBlocBloc>()
        .add(CryptoHistoryBlocIntervalEvent(name: '${name}', interval: 'm5'));

    return BlocListener<CryptoHistoryBlocBloc, CryptoHistoryBlocState>(
      listener: (context, state) {},
      child: BlocBuilder<CryptoHistoryBlocBloc, CryptoHistoryBlocState>(
        builder: (context, state) {
          if (state is CryptoHistoryBlocIsLoaded) {
            final _historyList = state.cryptoHistoryList;
            CryptoHistory min = _historyList.reduce((value, element) =>
                value.price < element.price ? value : element);
            CryptoHistory max = _historyList.reduce((value, element) =>
                value.price > element.price ? value : element);
            return LineChart(
              LineChartData(
                minX: double.parse(
                  (_historyList[0].time).toString(),
                ),
                maxX: double.parse(
                    (_historyList[_historyList.length - 1].time).toString()),
                minY: min.price,
                maxY: max.price,
                lineTouchData: LineTouchData(
                  enabled: touch,
                ),
                titlesData: FlTitlesData(show: false),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  drawHorizontalLine: false,
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: _historyList
                        .map((e) => FlSpot((e.time).toDouble(), e.price))
                        .toList(),

                    color: Colors.blue,
                    barWidth: 3,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: false,
                    ),

                    // List<FlSpot> spots = _historyList.asMap().entries.map((e) {
                    //   return FlSpot(e.value.time, e.value.price).
                    // }).toList(),
                  )
                ],
              ),
            curve: Curves.linear,
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
