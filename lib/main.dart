import 'package:flutter/material.dart';
import 'package:tgsol9/post_result_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult postResult = null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Rudi Barus - 20170801321"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text((postResult != null)
              ? postResult.id + " | " + postResult.name + " | " + postResult.job + " | " + postResult.created : " Tidak Ada Data"),
            RaisedButton(
              onPressed: (){
                PostResult.connectToAPI("Barus", "Dokter").then((value) {
                  postResult = value;
                  setState(() {});
                });
              },
              child: Text("POST"),
            )
            ],
          ),
        ),
      ),
    );
  }
}
