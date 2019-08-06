import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ScatterChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = [
      [0, 5, 3.0],
      [1, 25, 5.0],
      [2, 100, 4.0],
      [3, 75, 8.5],
    ];
    final List<charts.Series<List, num>> seriesList = [new charts.Series<List, num>(
      id: 'Sales',
      domainFn: (List sales, _) => sales[0],
      measureFn: (List sales, _) => sales[1],
      radiusPxFn: (List sales, _) => sales[2],
      data: data,
    )];
    return new charts.ScatterPlotChart(seriesList);
  }
}
