class Quote {
  String? _author;
  int? _id;
  String? _quote;
  String? _permalink;

  Quote({
    String? author,
    int? id,
    String? quote,
    String? permalink,
  }) {
    _author = author;
    _id = id;
    _quote = quote;
    _permalink = permalink;
  }

  String? get author => _author;

  int? get id => _id;

  String? get quote => _quote;

  String? get permalink => _permalink;

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
