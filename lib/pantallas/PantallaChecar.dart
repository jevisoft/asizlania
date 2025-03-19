import 'package:asiz/clases/asistencia.dart';
import 'package:asiz/clases/dispositivo.dart';
import 'package:asiz/clases/trabajador.dart';
import 'package:asiz/data/BaseDatosControlador.dart';
import 'package:asiz/geolocalizacion/gps_helper.dart';
import 'package:asiz/helpers/MensajesHelper.dart';
import 'package:asiz/providers/trabajador_provider.dart';
import 'package:asiz/widgets/BotonCheckIn.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';


class PantallaChecar extends StatelessWidget{
  const PantallaChecar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
        icon: Icon(Icons.arrow_back, color: const Color.fromARGB(255, 229, 228, 228)),
        onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Checar'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(156, 17, 140, 1),
        foregroundColor: Color.fromRGBO(255, 255, 255, 1),
        ),
      body:Center(
        child: Column(
          mainAxisSize: MainAxisSize.min ,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text('Presione el boton para registrar su ENTRADA o SALIDA.',
              style: TextStyle(color: Color.fromRGBO(248, 136, 225, 1),
                  fontSize: 18),
              ),
            ),
            
            
             BotonCheckIn(onClick:(){ checar(context);   })
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(0, 0, 0, 1)      
      
    );
    
  }


  void checar(BuildContext context) async{ 

     DateTime horaCheck=DateTime.now();
     Trabajador? trabajador=context.read<TrabajadorProvider>().trabajador;
     Dispositivo? dispositivo=context.read<TrabajadorProvider>().dispositivo; 
    if(!await GpsHelper.obtenPermisosGPS()) return;    
    Position posicion=await GpsHelper.getPosicionActual();
    if(posicion.isMocked){
      Mensajeshelper.muestraMensajeError(context, "Posicion falsa. Desactive aplicaciones intermedias de posicionamiento.");
      return;
    }

    Asistencia? asistencia=await trabajador.getAsistenciaFromPosicion(posicion, dispositivo,horaCheck);
    if(asistencia.idAsistencia==""){
        Mensajeshelper.muestraMensajeError(context, "No se encuentra cerca de ningun centro de trabajo");
        return;
    }

    await BaseDatosControlador.guardaAsistencia(asistencia);
    Mensajeshelper.muestraMensaje(context, "Asistencia registrada !");
    context.read<TrabajadorProvider>().sincronizaAsistencias();
    Navigator.pop(context);
    
  }

  

}