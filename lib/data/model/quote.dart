/// author : "Bjarne Stroustrup"
/// id : 12
/// quote : "I have always wished for my computer to be as easy to use as my telephone; my wish has come true because I can no longer figure out how to use my telephone."
/// permalink : "http://quotes.stormconsultancy.co.uk/quotes/12"

class Quote {
  Quote({
      String? author, 
      int? id, 
      String? quote, 
      String? permalink,}){
    _author = author;
    _id = id;
    _quote = quote;
    _permalink = permalink;
}

  Quote.fromJson(dynamic json) {
    _author = json['author'];
    _id = json['id'];
    _quote = json['quote'];
    _permalink = json['permalink'];
  }
  String? _author;
  int? _id;
  String? _quote;
  String? _permalink;

  String? get author => _author;
  int? get id => _id;
  String? get quote => _quote;
  String? get permalink => _permalink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['author'] = _author;
    map['id'] = _id;
    map['quote'] = _quote;
    map['permalink'] = _permalink;
    return map;
  }

}