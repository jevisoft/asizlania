import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BaseDatosSqlite{
   
   Future<Database> getBaseDatos() async{
      String pathBaseDatos=await getDatabasesPath();
      String path=join(pathBaseDatos,'asizbd.db');

      return await openDatabase(path,version: 1,
      onCreate:_onCrearBaseDatos );

   }

   void _onCrearBaseDatos(Database db, int version) async{
      await db.execute('''
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
      await db.execute('''
        CREATE TABLE horario(
          id_horario INTEGER,
          horario_desc TEXT,
          hora_entrada TEXT)
      ''');

      await db.execute('''
        CREATE TABLE centros_trabajo(
          id_centro INTEGER,
          centro_trabajo TEXT,
          id_sucursal INTEGER,
          sucursal TEXT,
          posicion_latitud TEXT,
          posicion_longitud TEXT,
          es_principal INTEGER)
      ''');

      await db.execute('''
        CREATE TABLE asistencias(
          id_centro INTEGER,
          fecha_hora_utc TEXT,
          fecha_hora_local TEXT,
          fecha_hora_sync TEXT,
          sync INTEGER,
          id_horario INTEGER,
          id_asistencia TEXT)
      ''');
   }

   
}