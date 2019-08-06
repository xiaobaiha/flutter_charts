import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class LineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = [
      new DemoDataStructure(0, 5),
      new DemoDataStructure(1, 25),
      new DemoDataStructure(2, 100),
      new DemoDataStructure(3, 75),
    ];
    final List<charts.Series<DemoDataStructure, num>> seriesList = [new charts.Series<DemoDataStructure, int>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (DemoDataStructure sales, _) => sales.year,
      measureFn: (DemoDataStructure sales, _) => sales.sales,
      data: data,
    )];
    return new charts.LineChart(seriesList);
  }
}

class DemoDataStructure {
  final int year;
  final int sales;
  DemoDataStructure(this.year, this.sales);
}