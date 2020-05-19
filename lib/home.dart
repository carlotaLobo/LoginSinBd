import 'package:flutter/material.dart';

class MySecondHomePage extends StatefulWidget {
  final mail;
  final pwd;

  MySecondHomePage({@required this.pwd, @required this.mail});
  @override
  _MySecondHomePageState createState() => _MySecondHomePageState();
}

class _MySecondHomePageState extends State<MySecondHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Text(widget.mail, textAlign: TextAlign.center),
            ),
            Expanded(
              child: Text(widget.pwd, textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}
