import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:my_diary/route/route.dart';
import 'package:my_diary/ui/views/add_new_note.dart';
import 'package:my_diary/ui/views/item_details.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  addNewNote() {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context) => AddNewNote());
  }

  Future<void> deleateCourse(selectDocument) {
    return FirebaseFirestore.instance
        .collection('notes')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('item')
        .doc(selectDocument)
        .delete()
        .then((value) => Fluttertoast.showToast(msg: 'deleat'))
        .catchError((error) => print(error));
  }

  final Stream<QuerySnapshot<Map<String, dynamic>>> _usersStream =
      FirebaseFirestore.instance
          .collection('notes')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection('item')
          .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => addNewNote(),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        //backgroundColor: Colors.white,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Something went wrong'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Card(
                  child: ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>ItemDetails(document.id, data['title'], data['dec'])));
                    },
                    title: Text(data['title']),
                    subtitle: Text(data['dec']),
                    trailing: IconButton(
                        onPressed: () => deleateCourse(document.id),
                        icon: Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        )),
                  ),
                );
              }).toList(),
            );
          }),
    );
  }
}
