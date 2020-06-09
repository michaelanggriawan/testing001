import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:coronaartikel/models/artikel.dart';
import 'package:coronaartikel/service/webservice.dart';
import 'DetailArtikel.dart';

class ArtikelState extends State<Artikel> {

  List<VirusArticle> _virusArticles = List<VirusArticle>();

  @override
  void initState() {
    super.initState();
    _populateVirusArticles();
  }

  void _populateVirusArticles() {
    Webservice().load(VirusArticle.all).then((a) => {
      setState(() => {
        _virusArticles = a
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: List.generate(_virusArticles.length, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailArtikel(
                      _virusArticles[index].title,
                      _virusArticles[index].author,
                      _virusArticles[index].content,
                      _virusArticles[index].picture,
                      _virusArticles[index].date,
                  )
                )
              );
            },
            child: Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(_virusArticles[index].picture),
                    fit: BoxFit.cover,
                  ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 130.0,
                    child:  Center(
                      child: Text(
                        _virusArticles[index].title,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          background: Paint()..color = Colors.red[800],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  )
                ],
              )
            )
          );
        })
      )
    );
  }
}

class Artikel extends StatefulWidget {

  @override
  createState() => ArtikelState();
}