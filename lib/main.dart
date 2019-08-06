import 'package:flutter/material.dart';
// import 'chart/line_chart.dart';
// import 'chart/bar_chart.dart';
// import 'chart/pie_chart.dart';
// import 'chart/scatter_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;
// import 'pages/line_chart_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primaryColor: Colors.white),
      home: new ChartDemo(),
      routes: <String, WidgetBuilder> {
        // '/line': (BuildContext context) => LineChart(),
        // '/bar': (BuildContext context) => BarChart(),
        // '/pie': (BuildContext context) => PieChart(),
        // '/scatter': (BuildContext context) => ScatterChart(),
      },
    );
  }
}

class ChartDemo extends StatelessWidget{
  Widget _buildDrawer(BuildContext context) {
    final _configTypes = ['line', 'bar', 'pie', 'scatter'];
    final localeZh = {
      'line': '折线图',
      'bar': '条形图',
      'pie': '饼图',
      'scatter': '散点图',
    };
    return Column(
      children: <Widget>[
        new SizedBox(
          height: 100,
          child: DrawerHeader(
            child: Container(
              width: 300,
              child: Text('图表类型'),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
        ),        
        Container(
          height: 400,
          child: ListView.separated(
            itemCount: _configTypes.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  title: Text(localeZh[_configTypes[index]]),
                  onTap: () {
                    Navigator.pushNamed(context, '/' + _configTypes[index]);
                  },
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
          ),
        ),
      ],
    );
  }
  Widget _buildChartList(BuildContext context) {
    final lineData = [
      [0, 5],
      [1, 25],
      [2, 100],
      [3, 75],
    ];
    final barData = [
      ['2010', 5],
      ['2011', 25],
      ['2012', 100],
      ['2013', 75],
    ];
    final scatterData = [
      [0, 5, 4.0],
      [1, 25, 10.5],
      [2, 100, 6.0],
      [3, 75, 8.0],
    ];
    final lineSeriesList = [new charts.Series<List, int>(
      id: 'line_chart',
      domainFn: (List demo, _) => demo[0],
      measureFn: (List demo, _) => demo[1],
      data: lineData,
    )];
    final barSeriesList = [new charts.Series<List, String>(
      id: 'bar_chart',
      domainFn: (List demo, _) => demo[0],
      measureFn: (List demo, _) => demo[1],
      data: barData,
    )];
    final scatterSeriesList = [new charts.Series<List, num>(
      id: 'scatter_chart',
      domainFn: (List demo, _) => demo[0],
      measureFn: (List demo, _) => demo[1],
      radiusPxFn: (List demo, _) => demo[2],
      data: scatterData,
    )];
    return ListView(
      children: <Widget>[
        Container(
          height: 200,
          child: new charts.LineChart(lineSeriesList),
        ),
        Container(
          height: 200,
          child: new charts.BarChart(barSeriesList),
        ),
        Container(
          height: 200,
          child: new charts.PieChart(lineSeriesList),
        ),
        Container(
          height: 200,
          child: new charts.ScatterPlotChart(scatterSeriesList),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter图表'), 
      ),
      drawer: Drawer(
        child: _buildDrawer(context)
      ),
      body: Center(child: _buildChartList(context)),
    );
  }
}