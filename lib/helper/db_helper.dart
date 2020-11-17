import '../model/data_model.dart';
import 'package:path/path.dart'
    as path; // will find the location or the path of database
import 'package:sqflite/sqflite.dart';

class DBHelper {
  //we will make one istance of this class
  //factory way
  // if there is an object it will use the same object
  // singleton design patterns

  //constructor return _instance
  factory DBHelper() => _instance;
  //named constructor return
  DBHelper.internal();

  // only one instance of our class
  static final DBHelper _instance = DBHelper.internal();

  //variable of database == come from import 'package:sqflite/sqflite.dart';
  static Database _database;

////working with methods /////

  //create database
  Future<Database> createDatabase() async {
    // check if variable _database => point to a real db
    if (_database != null) {
      // means there is an object
      return _database; // then return the existing database
    } else {
      //create database

      //1- defien path to get location of databse and it to it "bmi.db"
      String _path = path.join(await getDatabasesPath(), "bmi.db");

      //creating database
      // versions mean this is the first time i create database
      // version : if i need to upgrade this database i will make it 2
      // and so on
      _database = await openDatabase(
        _path,
        version: 1,
        //on create used for first time at version 1
        //if the database 'bmi.db' doesn't exist
        onCreate: (Database db, int v) {
          //creating all tables in database
          //execte usesd to write sql
          db.execute("""
            create table bmi_resutls(
              id INTEGER primary key autoincrement ,
              title varchar(50),
              detail varchar(255),
              result DOUBLE,
              weight DOUBLE,
              age DOUBLE,
              height DOUBLE,
              gender varchar(50),
              dateTime TEXT )""");
        },
        //on upgrade used for if the databse 'bmi.db' exist
        // and the version you write above not the same the version exists
        //it higher than it
        //onUpgrade: ,

        //on downGrade used for if the databse 'bmi.db' exist
        // and the version not the same but lower than  the existing version
        //// onDowngrade: ,

        //before onupgrade or ondowngrade configre will run to make a relation
        //onConfigure :,
      );

      return _database;
    }
  }

  Future<int> insert(BmiData data) async {
    Database db = await createDatabase();
    // the id is auto generate so we must retur it

    return await db.insert("bmi_resutls", {
      'title': data.title,
      'detail': data.detail,
      'result': data.result,
      'weight': data.weight,
      'age': data.age,
      'height': data.height,
      'gender': data.gender == Gender.female ? "female" : "male",
      'dateTime': data.dateTime.toIso8601String()
    });
  }

  Future<List> getAllResults() async {
    Database db = await createDatabase();

    //return await db.rawQuery("select * from bmi_resutls").;
   // print(await db.query("bmi_resutls"));
    return await db.query("bmi_resutls");
    //.map((item) => BmiData(age: item['age''] ));
    //uture<List<Map<String, dynamic>>>
  }

  Future<int> delete(int id) async {
    Database db = await createDatabase();
    return (await db.delete("bmi_resutls", where: 'id ? ', whereArgs: [id]));
  }
}
