import 'package:flutter/material.dart';

class AddNewNote extends StatefulWidget {
  const AddNewNote({Key? key}) : super(key: key);

  @override
  State<AddNewNote> createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _decController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15,left: 15,right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,

      ),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              hintText: 'title'
            ),
          ),
          TextField(
            controller: _decController,
            decoration: InputDecoration(
                hintText: 'title'
            ),
          ),
        ],
      ),
    );
  }
}
