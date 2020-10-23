import 'dart:convert';

class TestWord {
  final String creator;
  final String word;
  TestWord({
    this.creator = "Bzoozle",
    this.word,
  });

  TestWord copyWith({
    String creator,
    String word,
  }) {
    return TestWord(
      creator: creator ?? this.creator,
      word: word ?? this.word,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'creator': creator,
      'word': word,
    };
  }

  factory TestWord.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TestWord(
      creator: map['creator'],
      word: map['word'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TestWord.fromJson(String source) =>
      TestWord.fromMap(json.decode(source));

  @override
  String toString() => 'TestWord(creator: $creator, word: $word)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TestWord && o.creator == creator && o.word == word;
  }

  @override
  int get hashCode => creator.hashCode ^ word.hashCode;
}
