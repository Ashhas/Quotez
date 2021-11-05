import 'package:hive/hive.dart';

part 'quote.g.dart';

@HiveType(typeId: 0)
class Quote extends HiveObject {
  /// The Author of the quote
  @HiveField(0)
  late String author;

  /// The database id of the quote
  @HiveField(1)
  late int id;

  /// Text of the quote
  @HiveField(2)
  late String quote;

  /// An URL where the quote can be found
  @HiveField(3)
  late String permalink;

  Quote({
    required this.author,
    required this.id,
    required this.quote,
    required this.permalink,
  });

  Quote.fromJson(dynamic json) {
    author = json['author'];
    id = json['id'];
    quote = json['quote'];
    permalink = json['permalink'];
  }
}
