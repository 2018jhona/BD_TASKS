import 'package:bd_proyecto/pages.dart/home_page.dart';
import 'package:flutter/cupertino.dart';


import 'package:flutter/material.dart';

void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget{
  const Myapp({Key? key}): super(key: key);

  @override 

  Widget build(BuildContext context) {

    return MaterialApp(
      title: "TaskDBApp",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}