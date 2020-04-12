import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/**
 * 创建一个新的页面的 无状态的
 */
class Two extends StatelessWidget {
  const Two({
    Key key,
    @required this.text,
    this.backgroundColor: Colors.blue,
  }) : super(key: key);
  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    //获取参数
    var arg1 = ModalRoute.of(context).settings.arguments;

    return Center(
      child: new Container(
        color: backgroundColor,
        child: new Text(text),
      ),
    );
  }
}

/**
 * 创建一个有状态的
 */
class TwoStateWidget extends StatefulWidget {
  const TwoStateWidget({Key key, this.intValue: 0});

  final int intValue;

  @override
  State<StatefulWidget> createState() => new TwoState();
}

/**
 * 创建的state
 */
class TwoState extends State<TwoStateWidget> {
  int count;

  @override
  Widget build(BuildContext context) {
    debugPrint('build====');
    return Scaffold(
      body: Center(
        child: FlatButton(
            onPressed: () {
              setState(() {
                ++count;
              });
            },
            child: Text('现在的数字 $count')),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    count = widget.intValue;
    debugPrint('initState====');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('didChangeDependencies====');
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint('dispose====');
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactive");
  }

  @override
  void reassemble() {
    super.reassemble();
    debugPrint('reassemble====');
  }

  @override
  void didUpdateWidget(TwoStateWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint('didUpdateWidget====');
  }
}
