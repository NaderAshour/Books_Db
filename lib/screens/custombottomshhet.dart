import 'package:flutter/material.dart';
class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {

  TextEditingController namecontroller = TextEditingController();
  TextEditingController authorcontroller = TextEditingController();
  TextEditingController Urlcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (String name) {
                  setState(() {
                    name = namecontroller.text;
                  });
                },
                controller: namecontroller,
                decoration:
                InputDecoration(hintText: 'Book Name', labelText: 'Book'),
              ),
              TextField(
                onChanged: (String newauthor) {
                  setState(() {
                    newauthor = authorcontroller.text;
                  });
                },
                controller: authorcontroller,
                decoration: InputDecoration(
                  hintText: 'Book Author',
                  labelText: 'Author',
                ),
              ),
              TextField(
                onChanged: (String newurl) {
                  setState(() {
                    newurl = Urlcontroller.text;
                  });
                },
                controller: Urlcontroller,
                decoration: InputDecoration(
                  hintText: 'Book Cover Url',
                  labelText: 'Image Url',
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  onPressed: () {
                  // DbHelper.instance.addtodo(TodoDetails(
                  //     name: namecontroller.text,
                  //     date: chooseDate!.millisecondsSinceEpoch,
                  //     isChecked: false));

                  // print(todo);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
