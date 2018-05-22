# rect_getter

A widget provide a simple way to get child&#x27;s rectangle information after rendered.

![](https://github.com/debuggerx01/rect_getter/blob/master/example/demo.gif?raw=true)

## Usage
To use this plugin, add `rect_getter` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

### Example

``` dart
// Import package
import 'package:rect_getter/rect_getter.dart';

// Instantiate it

var globalKey = RectGetter.createGlobalKey();
var rectGetter = new RectGetter(
    key: globalKey,
    child: _child,
);

or

var rectGetter = new RectGetter.defaultKey(
    child: _child,
);


// and add it to your layout .

// then you can get rect by

Rect rect = rectGetter.getRect();

or

Rect rect = RectGetter.getRectFromKey(globalKey);


```


## Getting Started

For help getting started with Flutter, view our online [documentation](https://flutter.io/).

For help on editing package code, view the [documentation](https://flutter.io/developing-packages/).
