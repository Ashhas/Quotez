class Quote {
  late String _author;
  late int _id;
  late String _quote;
  late String _permalink;

  Quote({
    required String author,
    required int id,
    required String quote,
    required String permalink,
  }) {
    _author = author;
    _id = id;
    _quote = quote;
    _permalink = permalink;
  }

  String get author => _author;

  int get id => _id;

  String get quote => _quote;

  String get permalink => _permalink;

  Quote.fromJson(dynamic json) {
    _author = json['author'];
    _id = json['id'];
    _quote = json['quote'];
    _permalink = json['permalink'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['author'] = _author;
    map['id'] = _id;
    map['quote'] = _quote;
    map['permalink'] = _permalink;
    return map;
  }
}
