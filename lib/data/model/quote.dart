import 'package:hive/hive.dart';

part 'quote.g.dart';

@HiveType(typeId: 0)
class Quote extends HiveObject {
  @HiveField(0)
  late String author;

  @HiveField(1)
  late int id;

  @HiveField(2)
  late String quote;

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
