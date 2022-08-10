import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({Key? key}) : super(key: key);

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {

  TextEditingController _titleController = TextEditingController();
  TextEditingController _decController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Write note'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.save_as_outlined,color: Colors.green,))
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
