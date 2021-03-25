import 'dart:async';
import 'dart:convert';
import 'dart:io';
// import 'package:uri/uri.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  // List data;

  Future<String> getData() async {
    // http.post('http://cbsdjkvb.sdcndvj.sdbjdfvb/sdvdf/sdcd/sddsdv',body: {"username":Tedsddsbcdjh.text,"passas",})
    // http.get("http://bdjfhvdf.sdsvudfv.com/dfvdfv/sdvdfv/dvdv?username${sdjhdf}&nvbhdf=${sdvnfbhd}")
    var response = await http.get(
        Uri.encodeFull('http://192.168.100.76:3001/api/users/'),
        headers: {
          "Accept": "application/json"
        }
    );
    List data = json.decode(response.body);
    for(int i=0; i<data.length;i++){
      print(data[i]["id"]);
    }


    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new RaisedButton(
          child: new Text("Get data"),
          onPressed: getData,
        ),
      ),
    );
  }
}