import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    //   Scaffold(
    //     appBar: AppBar(
    //       title: Text('welcome to Flutter'),
    //     ),
    //     body: Center(
    //       // child: Text('hello world'),
    //       //child:Text(wordPair.asPascalCase),
    //       child: RandomWords(),
    //     ),
    //   ),
    );
  }
}
class RandomWordsState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context){
    return Scaffold (
      appBar:AppBar(
        title: Text('Startup Name Genarator'),
      ),
      body: _buildSuggestions(),
    );
  }
  Widget _buildSuggestions(){
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      // The itemBuilder callback is called once per suggested word pairing,
      // and places each suggestion into a ListTile row.
      // For even rows, the function adds a ListTile row for the word pairing.
      // For odd rows, the function adds a Divider widget to visually
      // separate the entries. Note that the divider may be difficult
      // to see on smaller devices.
      itemBuilder: (context, i){
        // Add a one-pixel-high divider widget before each row in theListView.
        if(i.isOdd) return Divider();
        final index = i ~/ 2;
        // If you've reached the end of the available word pairings...
        if (index>= _suggestions.length){
          // ...then generate 10 more and add them to the suggestions list.
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      // Add a one-pixel-high divider widget before each row in theListView.
      }
    );      
  }
  Widget _buildRow(WordPair pair){
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}


