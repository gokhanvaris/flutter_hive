import 'package:hive/hive.dart';

part 'books.g.dart';

@HiveType(typeId: 1)
class Books {
  Books({
    this.id,
    this.book_title,
    this.book_author,
  });

  @HiveField(0)
  int? id;

  @HiveField(1)
  String? book_title;

  @HiveField(2)
  String? book_author;
}
