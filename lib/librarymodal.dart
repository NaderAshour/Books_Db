import 'package:books/provider/database.dart';

class LibraryDetails {
  int? id;
  late String name;
  late String author;
  late String url;

  LibraryDetails({
    this.id,
    required this.name,
    required this.author,
    required this.url,
  });
  LibraryDetails.fromMap(Map<String, dynamic> inmap) {
    if (inmap[columnId] != null) {
      this.id = inmap[columnId];
    }
    this.name = inmap[columnName];
    this.author = inmap[columnAuthor];
    this.url = inmap[columnUrl] ;
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (this.id != null) {
      map[columnId] = this.id;
    }
    map[columnName] = this.name;
    map[columnAuthor] = this.author;
    map[columnUrl] = this.url;
    return map;
  }
}
