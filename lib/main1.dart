import 'package:english_words/english_words.dart' as prefix0;
import 'package:flutter/material.dart';

//引入外包
import 'package:english_words/english_words.dart';

//void main() {
//  runApp(new MyApp());
//}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
    return new MaterialApp(
      title: "welcome to 标题的",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('appbar的 title'),
        ),
        body: new Center(
//          child: new Text(wordPair.asUpperCase),
          child: new RandomWords(),
        ),
      ),
    );
  }

}
//有状态的
class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RondomState();
  }

}

class RondomState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final _suggestions = <WordPair>[];
    final _bigggerFont = const TextStyle(fontSize: 12);

    final _saved = new Set<WordPair>();
    Widget _buildeRow(WordPair pair) {
      final already = _saved.contains(pair);
      return ListTile(
        title: new Text(
          pair.asPascalCase,
          style: _bigggerFont,
        ),
        trailing: new Icon(
          already ? Icons.favorite : Icons.favorite_border,
          color: already? Colors.red :null,
         ),
//        onTap: (){
//          setState(() {
//            if(already){
//              _saved.remove(pair);
//            }else{
//              _saved.add(pair);
//            }
//          });
//        },
      );
    }

    Widget _buildSuggestions() {
      return new ListView.builder(padding: const EdgeInsets.all(1.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildeRow(_suggestions[index]);
        },
        itemCount: 200,);
    }


    return new Scaffold(
      appBar: new AppBar(
        title: new Text('新的开始的'),
      ),
      body: _buildSuggestions(),
    );
  }

}


class demo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
       theme: new ThemeData(
          accentColor: Colors.lightGreen[800],
       ),
    );
  }
}

class theme extends  StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        new Theme(
          data: Theme.of(context).copyWith(accentColor: Colors.lightGreen),
          child: new FlatButton(onPressed: null, child: new Text('de')),
        ),
      ],
    );
  }

}