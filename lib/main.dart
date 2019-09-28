// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:english_words/english_words.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StartUp Name Generator',
      theme: ThemeData(primaryColor: Colors.black, brightness: Brightness.dark),
      home: RandomWords()
    );
  }
}

class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState()=>RandomWordsState();
}

class RandomWordsState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final _textSize = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('StartUp Name Generator'),
      ),
      body: _buildSuggestion()
    );
  }

  Widget _buildSuggestion(){
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        //Item builder is a callback that is called once everytime a new item is beeing created
        itemBuilder: (context, i){
          //If i is odd, then it should be a dividing line between items
          if(i.isOdd) return Divider();

          final index=i~/2;
          //If the list is bigger than the actual content of it, it means the user has reached its end, so we add another 10 pairs of words
          if (index>=_suggestions.length){
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
    });
  }

  //This widget receives a wordpair as parameter and then converts it to a Text widget inside a ListTile widget
  Widget _buildRow(WordPair pair){
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _textSize,
      )
    );
  }
}

