class Word {
  final String word;
  final String phonetic;
  final List<String> meanings;

  Word({required this.word, required this.phonetic, required this.meanings});

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      word: json['word'],
      phonetic: json['phonetic'],
      meanings: List<String>.from(json['meanings']),
    );
  }
}