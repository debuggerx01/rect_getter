import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' show Random;

import 'package:rect_getter/rect_getter.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Random random = new Random();

  var _counter = 21;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new GridView.builder(
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: _counter,
        itemBuilder: (BuildContext context, int index) {
          if (index == _counter - 1) {
            new Timer(Duration.zero, () {
              setState(() {
                _counter += 21;
              });
            });
          }

          var globalKey = RectGetter.createGlobalKey();
          return new FittedBox(
            child: new RectGetter(
              key: globalKey,
              child: new GestureDetector(
                onTap: () {
                  var rect = RectGetter.getRectFromKey(globalKey);
                  Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('$index : ${rect.toString()}')));
                },
                child: new Container(
                  color: Colors.primaries[index % Colors.primaries.length],
                  width: random.nextInt(100) + 100.0,
                  height: random.nextInt(150) + 150.0,
                  child: new Center(
                    child: new Text('$index'),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
