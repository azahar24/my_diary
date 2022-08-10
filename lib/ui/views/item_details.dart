import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ItemDetails extends StatefulWidget {
  String documentId;
  String nodetsTitle;
  String nodetsDes;
  ItemDetails(this.documentId,this.nodetsTitle,this.nodetsDes);


  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {

  TextEditingController _titleController = TextEditingController();
  TextEditingController _decController = TextEditingController();
  User? currntUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController.text = widget.nodetsTitle;
    _decController.text = widget.nodetsDes;
  }


  updateData(selectedDocument) async {
    FirebaseFirestore.instance
        .collection('notes')
        .doc(currntUser!.email)
        .collection('item').doc(selectedDocument)
        .update({
      'title': _titleController.text,
      'dec': _decController.text,
    }).whenComplete(() {
      Fluttertoast.showToast(msg: "update sec");
    }).catchError((error) => printError());
    print('Secces add');
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Write note'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: ()=>updateData(widget.documentId), icon: Icon(Icons.save_as_outlined,color: Colors.green,))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10,left: 10, right: 10),
              height: 50,
              child: TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: 'enter your title',
                  hintStyle: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: Colors.amber)),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 600,
              child: TextField(
                maxLines: null,
                expands: true,
                controller: _decController,
                decoration: InputDecoration(
                  hintText: 'enter your description',
                  hintStyle: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: Colors.amber)),
            ),
          ],
        ),
      ),
    );
  }
}
