import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp()); // one line function

//StatefullWiget
// the co giao dien thay doi khi thuoc tinh thay doi
class RandomEnglishWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // State la noi chua cac thuoc tinh thay doi
    return new RandomEnglishWordsState();
  }

}
//State
class RandomEnglishWordsState extends State<RandomEnglishWords>{
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    // TODO: implement build
    return new Text(
      wordPair.asUpperCase,
      style: new TextStyle(fontSize: 22.0),
    );
  }

}

class MyApp extends StatelessWidget {
  //Stateless = immutatble = cannot change object 's properties
  // Every UI componnets are widgets
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    // TODO: implement build
    return new MaterialApp(
      title: "This is my first Flutter App",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("This is header 's  title"),
        ),
        body: new Center(
//          child: new Text("This is at the body 's center"),
//          child: new Text(
//              wordPair.asUpperCase,
//            style: new TextStyle(fontSize: 22.0),
//          ),
        child: new RandomEnglishWords(),
        ),
      ),
    );
  }

}