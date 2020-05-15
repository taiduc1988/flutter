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
class RandomEnglishWordsState extends State<RandomEnglishWords> {
  final _words = <WordPair>[];
  final _checkedWords = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    //Now we replace this with a Scaffold widget which contains a ListView
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("List of English words"),
      ),
      body: new ListView.builder(itemBuilder: (context, index) {
        if (index >= _words.length) {
          _words.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_words[index], index);
      }),
    );
  }

  Widget _buildRow(WordPair wordPair, int index) {
    final textColor = index % 2 == 0 ? Colors.red : Colors.blue;
    final isChecked = _checkedWords.contains(wordPair);
    return new ListTile(
      leading:
          new Icon(
              isChecked ? Icons.check_box : Icons.check_box_outline_blank,
            color: textColor,
          ),
      title: new Text(
        wordPair.asUpperCase,
        style: new TextStyle(fontSize: 18.0, color: textColor),
      ),
      onTap: () {
        setState(() {
          //This is anonymous function
          if (isChecked) {
            _checkedWords.remove(wordPair);
          } else {
            _checkedWords.add(wordPair);
          }
        });
      },
    );
  }
}

class MyApp extends StatelessWidget {
  //Stateless = immutatble = cannot change object 's properties
  // Every UI componnets are widgets
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        title: "This is my first Flutter App", home: new RandomEnglishWords());
  }
}
