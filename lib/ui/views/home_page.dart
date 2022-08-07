import 'package:flutter/material.dart';
import 'package:my_diary/ui/views/add_new_note.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  addNewNote(){
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context)=>AddNewNote()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>addNewNote(),
        child: Icon(Icons.add,color: Colors.white,),
        //backgroundColor: Colors.white,
      ),
    );
  }
}
