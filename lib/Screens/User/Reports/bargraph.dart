import 'dart:math';

import 'package:fast_charts/fast_charts.dart';
import 'package:twg/untils/export_file.dart';

class Bargraphs extends StatefulWidget {
  const  Bargraphs({super.key});

  @override
  State<Bargraphs> createState() => _BargraphsState();
}

class _BargraphsState extends State<Bargraphs> {
  @override
  Widget build(BuildContext context) {
    return SimpleStackedBarChart();
  }
}

//
class SimpleStackedBarChart extends StatelessWidget {
  const SimpleStackedBarChart({super.key});

  static final random = Random();

  // Simplified data creation
  static final List<String> domains = ['A', 'B', 'C', 'D'];
  static final List<Color> colors = [
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.redAccent,
    Colors.yellowAccent,
  ];

  static final List<Series<String, int>> data =
      List.generate(colors.length, (index) {
    return Series<String, int>(
      data: {
        for (var domain in domains) domain: random.nextInt(100) + 1,
      },
      colorAccessor: (_, __) => colors[index],
      measureAccessor: (value) => value.toDouble(),
      labelAccessor: (domain, value, percent) => ChartLabel(
        '$value',
        style: const TextStyle(fontSize: 12, color: Colors.black),
        position: LabelPosition.inside,
        alignment: Alignment.center,
      ),
    );
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: StackedBarChart(
        data: data,
        valueAxis: Axis.vertical, // Remove Y-axis data
        barPadding: 12,
        barSpacing: 12,
        padding: const EdgeInsets.all(16.0),
        radius: const Radius.circular(12),
        animationDuration: const Duration(milliseconds: 300),
      ),
    );
  }
}
