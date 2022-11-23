
import 'dart:html';
import 'dart:io';
import 'package:bd_proyecto/db.dart/models.dart/task_model.dart';
import 'package:flutter_codigo_taskdb/models/task_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlflite/sqflite.dart';

class DBAdmin{

Database? myDatabase;
//singleton
static final BDAdmin db= BDAdmin._();
BDAdmin._();
//
Future<Database?> checkDatabase()async{
if(myDatabase ! =null){

  return myDatabase;
}
myDatabase=await initDatabase(); //crear base de datos 
return myDatabase;
}
Future<Database> initDatabase()async{
 Directory directory = await getApplicationDocumentsDirectory ();
 String path= join(directory.path, "TaskDB.db");
 return await openDatabase(
  path,
  version: 1,
  onOpen: (db){},
  onCreate : (Database dbx, int version)async{
//CREAR LA TABLA CORRESPONDIENTE
   await dbx.execute("CREATE TABLE TASK(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT  , description TEXT, status TEXT)");

  }
  );

}
insertRawTask()async{
  Database? db=await checkDatabase();
  int res =await db!.rawInsert("INSERT INTO TASK(title, description, status)VALUES('Ir de compras','Tenemos que ir a totus','False')");
  print(res);
}


insertTask()async{
  Database? db= await checkDatabase();
  int res= await db!.insert(
    "TASK",
    {
      "title": "Comprar el nuevo disco",
      "description":"Nuevo disco de epica",
      "status":"false",
    }
  );
  print(res); 
}
getRawTask()async{
  Database? db= await checkDatabase();
  db.rawQuery("SELECT * FROM Task");
  print(task);
}
  
  Future <List<TaskModel>> getTask()async{
     Database? db= await checkDatabase();
     List <Map<String, dynamic>> task=await db!.query("Task");
     List<TaskModel> TaskModelList= tasks.map((e) => TaskModel.deMapAmodel(e)).toList();

    //tasks.forEach((Element){
  //   TaskModel task =TaskModel.deMapAmodel(Element);
    // TaskModelList.add(task)
     //}
     //);
      return taskModelList;
  }

  updateRawTask() async{
     Database? db= await checkDatabase();
     int res = await db!.rawUpdate("UPDATE TASK SET title='ir de compras', description='comprar comida', status='true' WHERE  id=2");
     print(res);
  
  }
  deleteRawTask() async{
         Database? db= await checkDatabase();
       int res = await db!.rawDelete("DELETE FROM TASK WHERE id=2");
       print(res);
  }
  deleteTask()async{
         Database? db= await checkDatabase();
          int res = await db!.rawDelete(" TASK WHERE id=3");

  }
}