import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = [
      new DemoDataStructure('2010', 5),
      new DemoDataStructure('2011', 25),
      new DemoDataStructure('2012', 100),
      new DemoDataStructure('2013', 75),
    ];
    final List<charts.Series<DemoDataStructure, String>> seriesList = [new charts.Series<DemoDataStructure, String>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (DemoDataStructure sales, _) => sales.year,
      measureFn: (DemoDataStructure sales, _) => sales.sales,
      data: data,
    )];
    return new charts.BarChart(seriesList);
  }
}

class DemoDataStructure {
  final String year;
  final int sales;
  DemoDataStructure(this.year, this.sales);
}