import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class RandomWordsState extends State<RandomWords> {

  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);


  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(pair.asPascalCase, style: _biggerFont),
    );
  }



  Widget _buildSuggesstions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
        itemBuilder: (context, i) {
        if(i.isOdd) return Divider();

        final index = i ~/ 2;
        if(index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));

        }

        return _buildRow(_suggestions[index]);

        }
    );

  }


  @override
  Widget build(BuildContext context) {
//    final wordPair = WordPair.random();
//    return Text(wordPair.asPascalCase);

  return Scaffold(
    appBar: AppBar(
      title: Text('Startup Name Generator'),
      backgroundColor: Colors.amber,
    ),
    body: _buildSuggesstions(),
  );


  }


}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}
