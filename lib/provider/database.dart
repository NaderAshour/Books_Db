import 'package:books/librarymodal.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
const String columnId = 'id';
const String columnName = 'name';
const String columnAuthor = 'author';
const String columnUrl = 'url';
const String bookTable = 'books_table';
class DbHelper{
  static final DbHelper  instanse=DbHelper.internal();
factory DbHelper(){
  return instanse;
}
  DbHelper.internal();
late Database db;

Future opendatabase()async {
  var databasesPath = await getDatabasesPath();
  String path = await join(databasesPath, 'books_db');
  db = await openDatabase(path, version: 1, onCreate: (Database db, int v) {
    db.execute(
        'create table $bookTable($columnId integer primary key autoincrement,$columnName text not null,$columnAuthor text not null,$columnUrl text not null)');
  }
  );
}
Future<LibraryDetails> addbook(LibraryDetails book)async{
        db.insert(bookTable, book.toMap());
          return book;
}
Future<List<LibraryDetails>> allbooks()async{
List<Map<String,dynamic>>booksmaps=await db.query(bookTable);
if(booksmaps.isEmpty){
  return[];
}
else {
  List<LibraryDetails>Allbooks=[];
  booksmaps.forEach((element) { 
    Allbooks.add(LibraryDetails.fromMap(element));
  });
  return Allbooks;
}
}

Future<int> delete(int id)async{
return await db.delete(bookTable,where: '$columnId ?',whereArgs: [id]);
}
Future<int>update(LibraryDetails book)async{
  return await db.update(bookTable, book.toMap(),where: '$columnId ?',whereArgs: [book.id]);
}
}
