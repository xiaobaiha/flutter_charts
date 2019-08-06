import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class LineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = [
      [0, 5],
      [1, 25],
      [2, 100],
      [3, 75],
    ];
    final List<charts.Series<List, num>> seriesList = [new charts.Series<List, int>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (List demo, _) => demo[0],
      measureFn: (List demo, _) => demo[1],
      data: data,
    )];
    return new charts.LineChart(seriesList);
  }
}
