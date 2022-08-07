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
      padding: EdgeInsets.only(top: 25, left: 15, right: 15),
      height: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              hintText: 'title',
              hintStyle: TextStyle(
                fontSize: 18,
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFFC5C5C5))),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 300,
            child: TextField(
              maxLines: null,
              expands: true,
              controller: _decController,
              decoration: InputDecoration(
                hintText: 'description',
                hintStyle: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.amber)),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
              height: 40,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'CONTINUE',
                    style: TextStyle(fontSize: 16),
                  )))
        ],
      ),
    );
  }
}
