import 'package:coronaartikel/widgets/artikel.dart';
import  'package:flutter/material.dart';
import 'package:coronaartikel/service/postservice.dart';
import 'package:coronaartikel/utils/constant.dart';

class AddArtikel extends StatefulWidget {
  @override
  AddArtikelState createState() {
    return AddArtikelState();
  }
}

class AddArtikelState extends State<AddArtikel> {
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerAuthor = TextEditingController();
  final TextEditingController _controllerContent = TextEditingController();
  final TextEditingController _controllerPicture = TextEditingController();

  String title;
  String author;
  String content;
  String picture;

  PostService ps = PostService();
  final _formKey = GlobalKey<FormState>();

  void _postData() {
    Resource _data = Resource(Constants.api, title, author, content, picture);
    ps.postData(_data);
    _controllerTitle.text = '';
    _controllerAuthor.text = '';
    _controllerContent.text = '';
    _controllerPicture.text = '';
  }

  // user defined function
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Peringatan"),
          content: new Text("Yakin ingin menambahkan data"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Keluar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
                child: new Text('Tambahkan'),
                onPressed: () {
                    title = _controllerTitle.text;
                    author = _controllerAuthor.text;
                    content = _controllerContent.text;
                    picture = _controllerPicture.text;
                    _postData();
                    Navigator.of(context).pop();
                },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          key: _formKey,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal:  16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _controllerTitle,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Title is required';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        icon: const Icon(Icons.title),
                        labelText: 'Title'
                    ),
                  ),
                  TextFormField(
                    controller: _controllerAuthor,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Author is required';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        icon: const Icon(Icons.people),
                        labelText: 'Author'
                    ),
                  ),
                  TextFormField(
                    minLines: 3,
                    maxLines: 10,
                    //maxLengthEnforced: true,
                    controller: _controllerContent,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Content is required';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        icon: const Icon(Icons.note),
                        labelText: 'Content'
                    ),
                  ),
                  TextFormField(
                    controller: _controllerPicture,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Picture is required';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        icon: const Icon(Icons.image),
                        labelText: 'Picture'
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(left:40.0, top:20.0),
                      child: RaisedButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _showDialog();
                            }
                          },
                          child: Text('Submit')
                      )
                  )
                ],
              )
          )
      ),
    );
  }
}