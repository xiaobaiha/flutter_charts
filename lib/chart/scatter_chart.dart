import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ScatterChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = [
      new DemoDataStructure(0, 5, 3.0),
      new DemoDataStructure(1, 25, 5.0),
      new DemoDataStructure(2, 100, 4.0),
      new DemoDataStructure(3, 75, 6.5),
    ];
    final List<charts.Series<DemoDataStructure, num>> seriesList = [new charts.Series<DemoDataStructure, int>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (DemoDataStructure sales, _) => sales.year,
      measureFn: (DemoDataStructure sales, _) => sales.sales,
      radiusPxFn: (DemoDataStructure sales, _) => sales.radius,
      data: data,
    )];
    return new charts.ScatterPlotChart(seriesList);
  }
}

class DemoDataStructure {
  final int year;
  final int sales;
  final double radius;
  DemoDataStructure(this.year, this.sales, this.radius);
}