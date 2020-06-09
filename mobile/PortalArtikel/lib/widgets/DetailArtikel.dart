import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailArtikelState extends State<DetailArtikel> {

  @override
  Widget build(BuildContext context) {
    var dt = DateTime.parse(widget.d);
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Artikel'),
        backgroundColor: Colors.pink[800],
      ),
        body: ListView(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.network(widget.p),
                    SizedBox(height: 10.0),
                    Center(
                      child:Text(
                        widget.t,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ) ,
                    ),
                    Center(
                      child:Text(
                        'Created by ${widget.a}',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ) ,
                    ),
                    Center(
                      child:Text(
                        'AT ${dt.day.toString()}-${dt.month.toString()}-${dt.year.toString()}',
                        style: TextStyle(
                          fontSize: 7.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.justify,
                      ) ,
                    ),
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child:Center(
                            child:Text(
                                widget.c,
                                textAlign: TextAlign.justify,
                            )
                        )
                    )
                  ],
                )
            )
          ],
        )
    );
  }
}

class DetailArtikel extends StatefulWidget {
  final String t;
  final String a;
  final String c;
  final String p;
  final String d;

  DetailArtikel(this.t,  this.a, this.c, this.p,this.d);

  @override
  createState() => DetailArtikelState();
}