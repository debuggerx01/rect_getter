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
var rectGetter = RectGetter(
    key: globalKey,
    child: _child,
);

or

var rectGetter = RectGetter.defaultKey(
    child: _child,
);


// and add it to your layout .

// then you can get rect by

Rect rect = rectGetter.getRect();

or

Rect rect = RectGetter.getRectFromKey(globalKey);


```

## Read More : [利用RectGetter组件获取控件位置尺寸实现的几个高级效果和功能](https://juejin.im/post/5b6375f8e51d45190f4af4c2)


## Getting Started

For help getting started with Flutter, view our online [documentation](https://flutter.io/).

For help on editing package code, view the [documentation](https://flutter.io/developing-packages/).
