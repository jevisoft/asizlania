import 'package:asiz/clases/asistencia.dart';
import 'package:asiz/clases/centro_trabajo.dart';
import 'package:asiz/clases/dispositivo.dart';
import 'package:asiz/clases/horario.dart';
import 'package:asiz/clases/trabajador.dart';
import 'package:sqflite/sqflite.dart';
import 'BaseDatosSqlite.dart';

class BaseDatosControlador {

  static Future<void> eliminaDatos() async{
BaseDatosSqlite bd=BaseDatosSqlite();
      final base=await bd.getBaseDatos();
      Batch batch=base.batch();
     batch.delete("trabajador");
     batch.delete("horario");
     batch.delete("centros_trabajo");
     batch.delete("asistencias");
     batch.delete('dispositivo');
     
     batch.commit();
    await base.close();
  }

  static Future<void> guardaDispositivo(Dispositivo dispositivo) async{
      BaseDatosSqlite bd=BaseDatosSqlite();
      final base=await bd.getBaseDatos();     

      await base.delete('dispositivo');
      await base.insert('dispositivo', 
        {'id_dispositivo':dispositivo.idDispositivo,
        'codigo_vinculacion':dispositivo.codigoVinculacion});
      await base.close();
  }

  static Future<void> guardaTrabajador(Trabajador trabajador) async{
      BaseDatosSqlite bd=BaseDatosSqlite();
      final base=await bd.getBaseDatos();

     Batch batch=base.batch();

      batch.delete('trabajador');
      batch.delete('horario');
      batch.delete('centros_trabajo');
      
      batch.insert('trabajador', 
        {'id_empleado':trabajador.idEmpleado,
        'nombre':trabajador.nombre,
        'apellido_paterno':trabajador.apellidoPaterno,
        'apellido_materno':trabajador.apellidoMaterno,
        'fecha_nacimiento':trabajador.fechaNacimiento,
        'id_foto':trabajador.idFoto,
        'id_empresa':trabajador.idEmpresa,
        'empresa':trabajador.empresa,
        'puesto':trabajador.puesto});

        batch.insert('horario', 
        {'id_horario':trabajador.horario?.idHorario,
        'horario_desc':trabajador.horario?.horarioDesc,
        'hora_entrada':trabajador.horario?.horaEntrada});

        trabajador.centrosDeTrabajo?.forEach((ct) {
          batch.insert('centros_trabajo', 
            {'id_centro':ct.idCentro,
            'centro_trabajo':ct.centroTrabajo,
            'id_sucursal':ct.idSucursal,
            'sucursal':ct.sucursal,
            'posicion_latitud':ct.positionLat,
            'posicion_longitud':ct.positionLon,
            'es_principal':ct.esPrincipal});
        });

        await batch.commit(noResult: true);
        await base.close();
  }

  static Future<Trabajador?> getTrabajador() async{
      Trabajador? trabajador;
    BaseDatosSqlite bd=BaseDatosSqlite();
      final base=await bd.getBaseDatos();

       List<Map> listTrabajador= await base.query('trabajador');
       List<Map> listHorario= await base.query('horario');
       List<Map> listCentrosTrabajo= await base.query('centros_trabajo');
       if(listTrabajador.isEmpty){
        await base.close();
         return trabajador;
       }

      trabajador=Trabajador();

      trabajador.idEmpleado=listTrabajador[0]['id_empleado'];
      trabajador.nombre=listTrabajador[0]['nombre'];
      trabajador.apellidoPaterno=listTrabajador[0]['apellido_paterno'];
      trabajador.apellidoMaterno=listTrabajador[0]['apellido_materno'];
      trabajador.idEmpresa=listTrabajador[0]['id_empresa'];
      trabajador.idFoto=listTrabajador[0]['id_foto'];
      trabajador.empresa=listTrabajador[0]['empresa'];
      trabajador.fechaNacimiento=listTrabajador[0]['fecha_nacimiento'];
      trabajador.puesto=listTrabajador[0]['puesto'];

      Horario horario=Horario();

      horario.idHorario=listHorario[0]['id_horario'];
      horario.horarioDesc=listHorario[0]['horario_desc'];
      horario.horaEntrada=listHorario[0]['hora_entrada'];

      List<CentroTrabajo> centrosTrabajo=[];

     listCentrosTrabajo.forEach((ct){
          CentroTrabajo centro=CentroTrabajo();
          centro.idCentro=ct['id_centro'];
          centro.centroTrabajo=ct['centro_trabajo'];
          centro.idSucursal=ct['id_sucursal'];
          centro.sucursal=ct['sucursal'];

          centro.esPrincipal=(ct['es_principal']==1);
          centro.positionLat=ct['posicion_latitud'];
          centro.positionLon=ct['posicion_longitud'];
          centrosTrabajo.add(centro);
     });

      
      trabajador.horario=horario;
      trabajador.centrosDeTrabajo=centrosTrabajo;      

       await base.close();
      return trabajador;
  }

  Future<void> guardaAsistencia(Asistencia asistencia) async{
      BaseDatosSqlite bd=BaseDatosSqlite();
      final base=await bd.getBaseDatos();

                 
      await base.insert('asistencias', 
        {'id_centro':asistencia.centroTrabajo?.idCentro,
        'fecha_hora_utc':asistencia.fechaHoraUTC,
        'fecha_hora_local':asistencia.fechaHoraLocal,
        'fecha_hora_sync':asistencia.fechaHoraUTCsync,
        'sync':asistencia.sync,
        'id_horario':asistencia.horario?.idHorario,
        'id_asistencia':asistencia.idAsistencia
        });
      
        
        await base.close();
  }

  Future<List<Asistencia>> getAsistencias() async{
    List<Asistencia> lista=[];
      BaseDatosSqlite bd=BaseDatosSqlite();
      final base=await bd.getBaseDatos();

      List<Map> listaAsis= await base.rawQuery('select * from asistencias left join horarios using(id_horario) left join centros_trabajo using(id_centro)');

       listaAsis.forEach((lasis){
          Asistencia asis=Asistencia();
          CentroTrabajo ctAsis=CentroTrabajo();
          Horario horarioAsis=Horario();

          horarioAsis.idHorario=lasis['id_horario'];
          horarioAsis.horarioDesc=lasis['horario_desc'];
          horarioAsis.horaEntrada=lasis['hora_entrada'];

          ctAsis.idCentro=lasis['id_centro'];
          ctAsis.centroTrabajo=lasis['centro_trabajo'];
          ctAsis.esPrincipal=lasis['es_principal'];
          ctAsis.idSucursal=lasis['id_sucursal'];
          ctAsis.sucursal=lasis['sucursal'];
          ctAsis.positionLat=lasis['posicion_latitud'];
          ctAsis.positionLon=lasis['posicion_longitud'];

          asis.centroTrabajo=ctAsis;
          asis.horario=horarioAsis;
          asis.fechaHoraLocal=lasis['fecha_hora_local'];
          asis.fechaHoraUTC=lasis['fecha_hora_utc'];
          asis.fechaHoraUTCsync=lasis['fecha_hora_sync'];
          asis.sync=(lasis['sync']==1);
          asis.idAsistencia=lasis['id_asistencia'];

          lista.add(asis);
       });


      await base.close();

      return lista;
  }

  Future<void> actualizaAsistenciaSync(Asistencia asistencia) async{
      BaseDatosSqlite bd=BaseDatosSqlite();
      final base=await bd.getBaseDatos();
             
      await base.rawUpdate('update asistencias set sync=1, fecha_hora_sync=\'${asistencia.fechaHoraUTCsync}\' where id_asistencia=\'${asistencia.idAsistencia}\'');
     
      await base.close();
  }

}