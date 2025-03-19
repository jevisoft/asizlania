import 'package:asiz/clases/asistencia.dart';
import 'package:asiz/geolocalizacion/gps_helper.dart';
import 'package:geolocator/geolocator.dart';

import 'centro_trabajo.dart';
import 'horario.dart';
import 'dispositivo.dart';

class Trabajador{
  int idEmpleado=0;
  String nombre='';
  String apellidoPaterno='';
  String apellidoMaterno='';
  String fechaNacimiento='';
  int idFoto=0;
  int idEmpresa=0;
  String empresa='';
  String puesto='';
  Horario? horario;    
  List<CentroTrabajo>? centrosDeTrabajo;

  CentroTrabajo? getCentroTrabajoPrincipal(){
        return centrosDeTrabajo?.firstWhere((CentroTrabajo ct)=>ct.esPrincipal);
  }

  Future<Asistencia> getAsistenciaFromPosicion(Position posicion,Dispositivo dispositivo,DateTime horaCheck) async{
     Asistencia asistencia=Asistencia();
     centrosDeTrabajo?.forEach((centro){        
        if(GpsHelper.distancia(posicion, double.parse(centro.positionLat), double.parse(centro.positionLon))<60){       
            asistencia.centroTrabajo=centro;          
        }
     });    
     if(asistencia.centroTrabajo==null) return asistencia;
     asistencia.idAsistencia=Asistencia.getIdAsistencia(horaCheck, idEmpleado, dispositivo.idDispositivo);
     asistencia.fechaHoraLocal=horaCheck.toLocal().toString().substring(0,19);
     asistencia.fechaHoraUTC=horaCheck.toUtc().toString().substring(0,19);
     asistencia.horario=horario;     
     return asistencia;
  }


  static Trabajador fromJson(Map<String,dynamic> json){
      Trabajador tra=Trabajador();
      tra.idEmpleado=int.parse(json["id_empleado"].toString());
      tra.nombre=json["nombre"].toString();
      tra.apellidoMaterno=json["ap"].toString();
      tra.apellidoPaterno=json["am"].toString();
      tra.fechaNacimiento=json["fecha_nac"].toString();
      tra.idFoto=int.parse(json["id_foto"].toString());
      tra.idEmpresa=int.parse(json["id_empresa"].toString());
      tra.empresa=json["empresa"].toString();
      tra.puesto=json["puesto"].toString();

      Horario horario=Horario();
      horario.idHorario=int.parse(json["id_horario"].toString());
      horario.horarioDesc=json["horario_desc"].toString();
      horario.horaEntrada=json["hora_entrada"].toString();

      tra.horario=horario;

      List<dynamic> listaCentrosJson=json["centros_trabajo"] as List<dynamic>;
      List<CentroTrabajo> lista_centros=[];
     
      listaCentrosJson.forEach((ctjson){
         CentroTrabajo centro=CentroTrabajo();

          centro.centroTrabajo=ctjson["centro"].toString();
          centro.idCentro=int.parse(ctjson["id_centro"].toString());
          centro.idSucursal=int.parse(ctjson["id_sucursal"].toString());
          centro.sucursal=ctjson["sucursal"].toString();
          centro.positionLat=ctjson["pos_latitud"].toString();
          centro.positionLon=ctjson["pos_longitud"].toString();
          centro.esPrincipal=(ctjson["es_principal"].toString()=="1");
          
          lista_centros.add(centro);
      });


      tra.centrosDeTrabajo=lista_centros;


      return tra;
  } 

}