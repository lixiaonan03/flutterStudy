
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/**
 * 跳转Url使用跳转示例
 */
class UrlDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: '使用第三方包示例',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('url示例'),
        ),
        body: new Center(
          child: new RaisedButton(
              onPressed: (){
                const url  ='https://www.baidu.com';
                launch(
                    url,
                forceWebView:true,
                enableDomStorage: true);
              },
              child: new Text('打开百度'),
          ),
        ),
      ),
    );
  }

}