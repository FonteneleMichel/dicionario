import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../word_details.dart';
import '../words.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  // Lista de palavras visitadas anteriormente
  List<Word> _visitedWords = [];

  @override
  void initState() {
    super.initState();
    _fetchVisitedWords();
  }

  Future<void> _fetchVisitedWords() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> visitedWords = prefs.getStringList('visited_words') ?? [];
    setState(() {
      _visitedWords = visitedWords.map((wordJson) {
        return Word.fromJson(jsonDecode(wordJson));
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Palavras Visitadas'),
      ),
      body: ListView.builder(
        itemCount: _visitedWords.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_visitedWords[index].word),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WordDetailScreen(word: _visitedWords[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
