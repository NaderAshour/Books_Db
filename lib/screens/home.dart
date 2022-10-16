import 'package:books/librarymodal.dart';
import 'package:books/provider/database.dart';
import 'package:books/screens/custombottomshhet.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
List<LibraryDetails> books=[];
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Avilable books',
            style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.w700, color: Colors.white),
          ),


        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                ),
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: CustomBottomSheet(),
                  );
                });
            setState(() {});
          },
          child: Icon(Icons.add),
        ),
        body:FutureBuilder<List<LibraryDetails>>(
          future: DbHelper.instanse.allbooks(),
          builder: (context,AsyncSnapshot snapshot){
            if(snapshot.hasError){
              return Center(
                  child: Text('error  ${snapshot.hasError.toString()}')
              );
            }
            if(snapshot.hasData){
              books=snapshot.data;
              print('there is a data');
              return ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    LibraryDetails bookobj = books[index];
                    return ListTile(
                      leading: Container(
                        width: 120,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image:DecorationImage(
                            image: NetworkImage('${bookobj.url}'),
                          ),
                        ),
                      ),
                      title: Text('${bookobj.name}'),
                      subtitle: Text(
                          'Author:${bookobj.author}'),
                      trailing: IconButton(
                          onPressed: () async {
                            setState(() async{
                             await DbHelper.instanse.delete(bookobj.id!);
                            });

                          },
                          icon: Icon(Icons.delete)),
                    );
                  }
                  );

            }
            return Center(
                child: Container(
                    height: 100,
                    width: 100,
                    child: CircularProgressIndicator()));

          },

        ) ,

      ),
    );
  }
}
