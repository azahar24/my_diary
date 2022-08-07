import 'package:flutter/material.dart';

class AddNewNote extends StatefulWidget {
  const AddNewNote({Key? key}) : super(key: key);

  @override
  State<AddNewNote> createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(),
      ],
    );
  }
}
