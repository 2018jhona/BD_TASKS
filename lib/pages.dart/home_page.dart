import 'dart:async';
import 'dart:html';

import 'package:bd_proyecto/db.dart/db_admin.dart';
import 'package:bd_proyecto/db.dart/models.dart/task_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{

Future<String> getFullName() Async(){
  return "Juan Manuel";
}

  @override 

  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar( 
        title: Text("HomePage"),
      ),
      body:  FutureBuilder(
       future:DBAdmin.db.getTask(),
       builder: (BuildContext context, AsyncSnapshot snap){
        if(snap.hasData){ 
          List <TaskModel> myTasks= snap.data;
        return ListView.builder(
        itemCount: myTasks.length,
        itemBuilder:(BuildContext context, int index){
          return ListTile(
           title: Text(myTasks[index].title),
           subtitle:  Text(myTasks[index].description),
           trailing: Text(myTasks[index].id.toString()),
          );  
        },
        );
           } 
        return const Center(
          child: CircularProgressIndicator(),
        );
       }          
    ),
    );
  }
  }