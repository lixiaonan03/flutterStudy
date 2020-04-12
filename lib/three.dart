import 'package:flutter/material.dart';

/**
 * 创建一个新的界面的
 */
class LxnAppBar extends StatelessWidget {
  final Widget title;

  LxnAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(
        children: <Widget>[
          new Container(
            height:70.0,
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 25),
            decoration: new BoxDecoration(color: Colors.blue[500]),
            child: new Row(
              children: <Widget>[
                new IconButton(
                    icon: new Icon(Icons.menu),
                    tooltip: '按钮文案的',
                    onPressed: null),
                new Expanded(child: title),
                new IconButton(
                    icon: new Icon(Icons.search),
                    tooltip: '搜索按钮的',
                    onPressed: null)
              ],
            ),
          )
        ],
      ),
    );
  }
}
