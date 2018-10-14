import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('welcome to Flutter'),
        ),
        body: Center(
          // child: Text('hello world'),
          //child:Text(wordPair.asPascalCase),
          child: RandomWords(),
        ),
      ),
    );
  }
}
class RandomWordsState extends State<RandomWords>{
  @override
  Widget build(BuildContext context){
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}


