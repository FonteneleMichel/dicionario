import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WordListScreen extends StatefulWidget {
  @override
  _WordListScreenState createState() => _WordListScreenState();
}

class _WordListScreenState extends State<WordListScreen> {
  List<String> wordList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('sua_url_da_api'));
    if (response.statusCode == 200) {
      setState(() {
        wordList = List.from(json.decode(response.body));
      });
    } else {
      print('Erro ao buscar os dados da API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: wordList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Center(
              child: Text(wordList[index]),
            ),
          );
        },
      ),
    );
  }
}
