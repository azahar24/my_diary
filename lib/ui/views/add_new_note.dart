import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../helper/auth_helper.dart';

class AddNewNote extends StatefulWidget {
  @override
  State<AddNewNote> createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _decController = TextEditingController();

  User? currntUser = FirebaseAuth.instance.currentUser;

  writeData() async {
    FirebaseFirestore.instance
        .collection('notes')
        .doc(currntUser!.email)
        .collection('item')
        .add({
      'title': _titleController.text,
      'dec': _decController.text,
    }).whenComplete(() {
      Fluttertoast.showToast(msg: "add sec");
    }).catchError((error) => printError());
    print('Secces add');
    Navigator.pop(context);
  }

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
                  onPressed: () =>writeData(),
                  child: Text(
                    'CONTINUE',
                    style: TextStyle(fontSize: 16),
                  )))
        ],
      ),
    );
  }
}
