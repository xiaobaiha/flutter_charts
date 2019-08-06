import 'package:flutter/material.dart';
import 'chart/line_chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Hello',
      theme: new ThemeData(primaryColor: Colors.white),
      home: new ChartDemo(),
      routes: <String, WidgetBuilder> {
        '/line': (BuildContext context) => LineChart(),
        '/bar': (BuildContext context) => LineChart(),
        '/pie': (BuildContext context) => LineChart(),
        '/scattor': (BuildContext context) => LineChart(),
      },
    );
  }
}

class ChartDemo extends StatefulWidget {
  @override
  createState() => new ChartDemoState();
}

class ChartDemoState extends State<ChartDemo>{
  Widget _buildDrawer() {
    final _configTypes = ['line', 'bar', 'pie', 'scattor'];
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        DrawerHeader(
          child: Text('Select type'),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ..._configTypes.map(
          (type) => ListTile(
            title: Text(type),
            onTap: () {
              Navigator.pushNamed(context, '/' + type);
            },
          )
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('list view'), 
      ),
      drawer: Drawer(
        child: _buildDrawer()
      ),
      body: new Text('chart demo'),
    );
  }
}