import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BaseDatosSqlite{
   
   Future<Database> getBaseDatos() async{
      String pathBaseDatos=await getDatabasesPath();
      String path=join(pathBaseDatos,'asizbd1.db');

      return await openDatabase(path,version: 1,
      onCreate:_onCrearBaseDatos,
      onUpgrade: _onUpgrade);

   }

   void _onCrearBaseDatos(Database db, int version) async{
      var batch=db.batch();
      creaTablas(batch);
      await batch.commit();
   }

   void _onUpgrade(Database db, int version,int oldVersion) async{
    var batch=db.batch();
      eliminaTablas(batch);
      creaTablas(batch);
      await batch.commit();
   }

  void creaTablas(Batch batch){
batch.execute('''
        CREATE TABLE trabajador(
          id_empleado INTEGER,
          nombre TEXT,
          apellido_paterno TEXT,
          apellido_materno TEXT,
          fecha_nacimiento TEXT,
          id_foto INTEGER,
          id_empresa INTEGER,
          empresa TEXT,
          puesto TEXT)
      ''');
      batch.execute('''
        CREATE TABLE horario(
          id_horario INTEGER,
          horario_desc TEXT,
          hora_entrada TEXT)
      ''');

      batch.execute('''
        CREATE TABLE centros_trabajo(
          id_centro INTEGER,
          centro_trabajo TEXT,
          id_sucursal INTEGER,
          sucursal TEXT,
          posicion_latitud TEXT,
          posicion_longitud TEXT,
          es_principal INTEGER)
      ''');

      batch.execute('''
        CREATE TABLE asistencias(
          id_centro INTEGER,
          fecha_hora_utc TEXT,
          fecha_hora_local TEXT,
          fecha_hora_sync TEXT,
          sync INTEGER,
          id_horario INTEGER,
          id_asistencia TEXT)
      ''');

      batch.execute('''
        CREATE TABLE dispositivo(
          id_dispositivo INTEGER,
          codigo_vinculacion TEXT)
      ''');
   }

   void eliminaTablas(Batch batch){
     batch.execute("DROP TABLE IF EXISTS trabajador");
     batch.execute("DROP TABLE IF EXISTS horario");
     batch.execute("DROP TABLE IF EXISTS centros_trabajo");
     batch.execute("DROP TABLE IF EXISTS asistencias");
     batch.execute("DROP TABLE IF EXISTS dispositivo");
   }
  

   
}