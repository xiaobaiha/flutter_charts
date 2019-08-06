import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
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
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if(i.isOdd) return new Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }
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