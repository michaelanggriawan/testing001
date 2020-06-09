import 'package:flutter/material.dart';

class Author extends StatefulWidget {
  @override
  _AuthorState createState() => _AuthorState();
}

class _AuthorState extends State<Author> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child:CircleAvatar(
                  backgroundImage: AssetImage('assets/thumb.jpeg'),
                  radius: 40.0,
                ),
              ),
              Divider(
                height: 90.0,
                color: Colors.pink[800],
              ),
              Text(
                'Name',
                style: TextStyle(
                  color: Colors.pink,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Michael Anggriawan',
                style: TextStyle(
                  color: Colors.pink[200],
                  letterSpacing: 2.0,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30.0),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.email,
                    color: Colors.pink[400],
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'michaelanggriawan941@gmail.com',
                    style: TextStyle(
                      color: Colors.pink[400],
                      fontSize: 10.0,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
            ],
          )
      ),
    );
  }
}






