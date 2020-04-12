import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/**
 * MaterialApp 风格的演示的
 */
class MaterialAppDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MaterialAppState();
  }
}

class MaterialAppState extends State<MaterialAppDemo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'flutter Material',
      home: new TutorialHome(),
    );
  }
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.menu), tooltip: '第一个的', onPressed: null),
        title: new Text('lxn菜单'),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search), tooltip: '搜索的', onPressed: null)
        ],
      ),
      body: new Center(
//        child: new Mybutton(),
        child: new Counter(),
      ),
      floatingActionButton: new FloatingActionButton(
          tooltip: 'add', child: new Icon(Icons.add), onPressed: null),
    );
  }
}

/**
 *  手势相关的的组件
 */
class Mybutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        //toast组件的一些是使用的    测试 抬起的
        Fluttertoast.showToast(
          msg: '抬起的',
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
          gravity: ToastGravity.CENTER,
        );
      },
      onDoubleTap: () {
        Fluttertoast.showToast(msg: '点击的');
      },
      child: new Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(44.0),
          color: Colors.lightGreen[500],
        ),
        child: new Center(
          child: new Text('手势按钮'),
        ),
      ),
    );
  }
}

/**
 * 有状态的stateful
 */
class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new CountState();
  }
}

class CountState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    //需要更新的时候必须调用 setState() 方法
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Row(
      children: <Widget>[
        new RaisedButton(
          onPressed: _increment,
          child: new Text('数字的'),
        ),
        new Text('Count: $_counter'),
      ],
    );
  }
}
