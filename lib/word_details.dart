import 'package:dicionario/screen/word_list.dart';
import 'package:dicionario/words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WordDetailScreen extends StatelessWidget {
  final Word word;

  WordDetailScreen({required this.word});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(word.word),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fonética: ${word.phonetic}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Significados:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: word.meanings.map((meaning) {
                return Text(meaning);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}