
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'three.dart';
import 'MaterialAppDemo.dart';
import 'UrlDemo.dart';
import 'two.dart';


class MyFlutterApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return new MaterialApp(
        //应用名称 目前不清楚这个在哪显示
        title: 'Flutter Demo',
        theme: new ThemeData(
          //主题色
            primarySwatch: Colors.blue),
        //注册路由表
        routes: {"new_page": (context) => new NewRouter()},
        //应用首页路由
        home: new MyHomePage(title: '开始学习的Home Page'),
        //测试调试的
//      home: new MyHomeDebug(),
      );
  }
}

// debugDumpApp();学习
class MyHomeDebug extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      child: new Center(
        child: new FlatButton(
            onPressed: () {
              //转储widget状态
//               debugDumpApp();
              //调试渲染层
              debugDumpRenderTree();
            },
            child: new Text("debugDumpApp")),
      ),
    );
  }
}

//首页  有状态的
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return new MyHomeState();
  }
}

class MyHomeState extends State<MyHomePage> {
  int count = 0;

  void add() {
    print("打印日志双引号====+$count=");
    print('打印日单引号==$count===');

    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("您点击按钮多少次啦"),
            new Text(
              '$count次',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text('打开新的页面'),
              textColor: Colors.blue,
              onPressed: () {
                //跳转一个新的页面
                /*  Navigator.push(context,
                    new MaterialPageRoute(builder:(context){
                       return new NewRouter();
                })*/
                /*  //等价于上面的调用方式
                 Navigator.of(context).push(new MaterialPageRoute(builder: (context){
                    return new NewRouter();
                 })*/
//                );
                Navigator.pushNamed(context, "new_page", arguments: "新的界面");
              },
            ),
            FlatButton(
              child: new Text('新的学习界面'),
              textColor: Colors.red,
              onPressed:(){
                Navigator.of(context).push(new MaterialPageRoute(builder: (context){
                  return new LxnAppBar(title: new Text(
                    'lxn',
                  )
                    ,);
                }));
              },
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: new Text('material 学习 '),
                  onPressed: (){
                    Navigator.of(context).push(new MaterialPageRoute(builder: (context){
                      return new MaterialAppDemo();
                    }));
                  },
                ),
                FlatButton(
                  child: new Text('url 跳转学习'),
                  textColor: Colors.red[700],
                  textTheme: ButtonTextTheme.normal,
                  disabledTextColor: Colors.red,
                  color: Color(0xFF82B1FF),
                  disabledColor: Colors.grey,
                  highlightColor: Colors.grey,
                  // 按下的背景色
                  splashColor: Colors.green,
                  // 水波纹颜色
                  colorBrightness: Brightness.light,
                  padding: EdgeInsets.all(10),
                  onPressed: (){
                    Navigator.of(context).push(new MaterialPageRoute(builder: (context){
                      return new UrlDemo();
                    }));
                  },
                )
              ],
            ),
            RandomWordsWidget(),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: add, tooltip: '增加', child: new Icon(Icons.add)),
    );
  }
}

/**
 * 跳转新的页面
 */
class NewRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint("debugPrint跳转新页面=====");
    debugPrint('debugPrint打印日单引号=====');
    //获取参数
    var arg1 = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: new AppBar(
        title: new Text('新的路由界面'),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text('新的界面内容====$arg1'),
          new Text('第二个内容====$arg1'),
          new ImageWidget(),
          new FlatButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return new TwoStateWidget();
              }));
            },
            child: new Text("跳转two页面"),
            color: Colors.red,
          )
        ],
      ),
    );
  }
}

/**
 * 生成随机字符串的Widget
 */
class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //生成随机字符串
    final words = new WordPair.random();

    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(words.toString()),
    );
  }
}

/**
 * 获取图片的wigget
 */
class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*return new DecoratedBox(decoration: new BoxDecoration(
      image: new DecorationImage(image: new AssetImage('assets/logo.png'))
    ));*/
    return Image.asset('assets/logo.png');
  }
}