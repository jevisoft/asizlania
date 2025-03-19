import 'dart:convert';
import 'package:asiz/api/ApiCas.dart';
import 'package:asiz/api/ApiCasHelper.dart';
import 'package:asiz/clases/dispositivo.dart';
import 'package:asiz/clases/trabajador.dart';
import 'package:asiz/data/BaseDatosControlador.dart';
import 'package:asiz/helpers/InfoDispositivo.dart';
import 'package:asiz/helpers/MensajesHelper.dart';
import 'package:asiz/providers/trabajador_provider.dart';
import 'package:flutter/material.dart';
import 'package:asiz/widgets/BotonVincular.dart';
import 'package:provider/provider.dart';

class PantallaVincular extends StatelessWidget{

  

  const PantallaVincular({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController codigoValorController=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
        icon: Icon(Icons.arrow_back, color: const Color.fromARGB(255, 229, 228, 228)),
        onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Vincular dispositivo'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(156, 17, 140, 1),
        foregroundColor: Color.fromRGBO(255, 255, 255, 1),
        ),
      body:Center(
        child: Column(
          mainAxisSize: MainAxisSize.min ,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Ingrese el código de vinculación',
              style: TextStyle(color: Color.fromRGBO(248, 136, 225, 1),
                  fontSize: 18),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(vertical:50, horizontal:30),
              child: TextField(
                controller: codigoValorController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                border: OutlineInputBorder(),                
                hintText: 'Codigo',
                hintStyle: TextStyle(color: Color.fromRGBO(161, 161, 161, 1))
              ), 
              style: TextStyle(color: Color.fromRGBO(170, 169, 170, 1)),
               ),
            ),
              BotonVincular(onClick: (){
                vincular(context,codigoValorController.text);
             }) 
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(0, 0, 0, 1)      
      
    );
    
  }

  
  
  void vincular(BuildContext context,String codigo) async{
  
   InformacionDispositivo info=await InfoDispositivoHelper.getInfo();
   var respuesta=await ApiCas.vincular(Apicashelper.getVincularDTO(info, codigo));
    
    if(respuesta.statusCode!=200){
        Mensajeshelper.muestraMensajeError(context, Apicashelper.getErrorBody(respuesta.body));
        return;
    }
    
     Trabajador trabajador=Trabajador.fromJson(jsonDecode(respuesta.body));
     Dispositivo dispositivo=Dispositivo.fromJson(jsonDecode(respuesta.body)); 
     
     await BaseDatosControlador.guardaTrabajador(trabajador);     
     await BaseDatosControlador.guardaDispositivo(dispositivo);

     context.read<TrabajadorProvider>().setTrabajador(trabajador,dispositivo);
     ApiCas.CHECK_API_KEY="${info.id}KJ!JK${dispositivo.codigoVinculacion}"; 
      
     Mensajeshelper.muestraMensaje(context, "Vinculado !");
     Navigator.pop(context);
  }

  
}