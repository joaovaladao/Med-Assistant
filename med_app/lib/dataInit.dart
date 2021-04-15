import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:med_app/screens/medicacoes/components/alarm_info.dart';

final String tableAlarm = 'alarm';
final String columnId = 'id';
final String columnDateTime = 'alarmDateTime';
final String columnDescription = 'description';
final String columnName = 'name';
final String columnDays = 'days';
final String columnIsActive = 'isActive';
final String columnColor = 'color';

class DataInit {
  static Database _database;
  static DataInit _dataInit;

  DataInit._createInstance();
  factory DataInit() {
    if (_dataInit == null) {
      _dataInit = DataInit._createInstance();
    }
    return _dataInit;
  }

    Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = dir + "alarm.db";

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          create table $tableAlarm ( 
          $columnId integer primary key autoincrement,
          $columnDateTime text not null,
          $columnDescription text not null,
          $columnName text not null,
          $columnDays integer,
          $columnIsActive integer,
          $columnColor integer
          )
        ''');
      },
    );
    return database;
  }

  void insertAlarm(AlarmInfo alarmInfo) async {
    var db = await this.database;
    var result = await db.insert(tableAlarm, alarmInfo.toMap());
    print('result : $result');
  }

  Future<List<AlarmInfo>> getAlarms() async {
    List <AlarmInfo> _alarms = [];

    var db = await this.database;
    var result = await db.query(tableAlarm);
    result.forEach((element) { 
      var alarmInfo = AlarmInfo.fromMap(element);
      _alarms.add(alarmInfo);
    });
    return _alarms;
  }

}