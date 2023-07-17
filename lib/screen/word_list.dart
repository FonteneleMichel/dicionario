import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config/config.dart';

class WordListScreen extends StatefulWidget {
  @override
  _WordListScreenState createState() => _WordListScreenState();
}

class _WordListScreenState extends State<WordListScreen> {
  String _randomWord = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchRandomWord();
  }

  Future<void> _fetchRandomWord() async {
    const apiKey = Config.apiKey;
    const apiUrl = 'https://wordsapiv1.p.rapidapi.com/words/';
    const headers = {
      'X-RapidAPI-Key': apiKey,
      'X-RapidAPI-Host': 'wordsapiv1.p.rapidapi.com',
    };

    try {
      final response = await http.get(Uri.parse(apiUrl + '?random=true'), headers: headers);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final randomWord = responseData['word'] as String;
        setState(() {
          _randomWord = randomWord;
          _isLoading = false;
        });
      } else {
        print('Erro na solicitação: ${response.statusCode}');
        setState(() {
          _isLoading = false;
        });
      }
    } catch (error) {
      print('Erro na solicitação: $error');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : Text(
          _randomWord,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
