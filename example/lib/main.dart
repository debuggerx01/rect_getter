import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' show Random;

import 'package:rect_getter/rect_getter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Random random = Random();

  var _counter = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: _counter,
        itemBuilder: (BuildContext context, int index) {
          if (index == _counter - 1) {
            Timer(Duration.zero, () {
              setState(() {
                _counter += 21;
              });
            });
          }

          var globalKey = RectGetter.createGlobalKey();
          return FittedBox(
            child: RectGetter(
              key: globalKey,
              child: GestureDetector(
                onTap: () {
                  var rect = RectGetter.getRectFromKey(globalKey);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$index : ${rect.toString()}')));
                },
                child: Container(
                  color: Colors.primaries[index % Colors.primaries.length],
                  width: random.nextInt(100) + 100.0,
                  height: random.nextInt(150) + 150.0,
                  child: Center(
                    child: Text('$index'),
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
