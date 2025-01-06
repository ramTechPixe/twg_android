// import 'dart:math';

// import 'package:fast_charts/fast_charts.dart';
// import 'package:twg/untils/export_file.dart';

// class Bargraphs extends StatefulWidget {
//   const  Bargraphs({super.key});

//   @override
//   State<Bargraphs> createState() => _BargraphsState();
// }

// class _BargraphsState extends State<Bargraphs> {
//   @override
//   Widget build(BuildContext context) {
//     return SimpleStackedBarChart();
//   }
// }

// //
// class SimpleStackedBarChart extends StatelessWidget {
//   const SimpleStackedBarChart({super.key});

//   static final random = Random();

//   // Simplified data creation
//   static final List<String> domains = ['A', 'B', 'C', 'D'];
//   static final List<Color> colors = [
//     Colors.blueAccent,
//     Colors.greenAccent,
//     Colors.redAccent,
//     Colors.yellowAccent,
//   ];

//   static final List<Series<String, int>> data =
//       List.generate(colors.length, (index) {
//     return Series<String, int>(
//       data: {
//         for (var domain in domains) domain: random.nextInt(100) + 1,
//       },
//       colorAccessor: (_, __) => colors[index],
//       measureAccessor: (value) => value.toDouble(),
//       labelAccessor: (domain, value, percent) => ChartLabel(
//         '$value',
//         style: const TextStyle(fontSize: 12, color: Colors.black),
//         position: LabelPosition.inside,
//         alignment: Alignment.center,
//       ),
//     );
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height / 2,
//       child: StackedBarChart(
//         data: data,
//         valueAxis: Axis.vertical, // Remove Y-axis data
//         barPadding: 12,
//         barSpacing: 12,
//         padding: const EdgeInsets.all(16.0),
//         radius: const Radius.circular(12),
//         animationDuration: const Duration(milliseconds: 300),
//       ),
//     );
//   }
// }
import 'package:twg/untils/export_file.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fast_charts/fast_charts.dart';

class Bargraphs extends StatefulWidget {
  const Bargraphs({super.key});

  @override
  State<Bargraphs> createState() => _BargraphsState();
}

class _BargraphsState extends State<Bargraphs> {
  ReportsOrGraphsController reportscontroller =
      Get.put(ReportsOrGraphsController());
  // Example dynamic data
  // graphsData
  final List<List<dynamic>> dataList = [
    ["Month", "Facebook"], // Static label
    ["December", 4], // Dynamic data
    ["January", 7], // Dynamic data
    ["December", 5], // Same month with different value
    ["February", 6], // Dynamic data
    ["December", 8], // Same month with another value
    ["March", 8], // Dynamic data
  ];

  @override
  Widget build(BuildContext context) {
    return SimpleStackedBarChart(dataList: dataList);
  }
}

// Stacked Bar Chart that takes dynamic data
class SimpleStackedBarChart extends StatelessWidget {
  final List<List<dynamic>> dataList;

  SimpleStackedBarChart({super.key, required this.dataList});

  static final random = Random();
  ReportsOrGraphsController reportscontroller =
      Get.put(ReportsOrGraphsController());
  // Colors for the bars
  static final List<Color> colors = [
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.redAccent,
    Colors.yellowAccent,
    Colors.purpleAccent,
    Colors.orangeAccent,
    Colors.cyanAccent,
    Colors.pinkAccent,
    Colors.brown,
  ];

  // Function to generate dynamic chart data
  List<Series<String, int>> generateChartData() {
    // Grouping values by domain (month)
    Map<String, List<int>> groupedData = {};

    for (var i = 1; i < reportscontroller.graphsData.length; i++) {
      String domain = reportscontroller.graphsData[i][0].toString();
      int value =
          int.tryParse(reportscontroller.graphsData[i][1].toString()) ?? 0;

      // Grouping values by domain (month)
      if (groupedData.containsKey(domain)) {
        groupedData[domain]!.add(value);
      } else {
        groupedData[domain] = [value];
      }
    }

    List<Series<String, int>> chartData = [];
    int colorIndex = 0;

    // For each domain, create bars
    groupedData.forEach((domain, valuesList) {
      for (int i = 0; i < valuesList.length; i++) {
        // Multiple bars for the same domain, each with a unique color
        chartData.add(Series<String, int>(
          data: {domain: valuesList[i]},
          colorAccessor: (_, __) => colors[
              colorIndex % colors.length], // Different colors for each value
          measureAccessor: (value) => value.toDouble(),
          labelAccessor: (domain, value, percent) => ChartLabel(
            '$value',
            style: const TextStyle(fontSize: 12, color: Colors.black),
            position: LabelPosition.inside,
            alignment: Alignment.center,
          ),
        ));
        colorIndex++; // Move to the next color for the next occurrence of the domain
      }
    });

    return chartData;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => reportscontroller.graphsData.isEmpty ||
            reportscontroller.graphsData == null
        ? Text("No data")
        : Container(
            height: MediaQuery.of(context).size.height / 2,
            child: StackedBarChart(
              data: generateChartData(),
              valueAxis: Axis.vertical,  
              barPadding: 12,
              barSpacing: 12,
              padding: const EdgeInsets.all(16.0),
              radius: const Radius.circular(12),
              animationDuration: const Duration(milliseconds: 300),
            ),
          ));
  }
}
