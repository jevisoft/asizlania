
import 'package:asiz/api/ApiCas.dart';
import 'package:asiz/clases/asistencia_item.dart';
import 'package:asiz/data/BaseDatosControlador.dart';
import 'package:asiz/helpers/MensajesHelper.dart';
import 'package:asiz/providers/trabajador_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PantallaPrincipal extends StatefulWidget{
  const PantallaPrincipal({
    super.key
  });

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
  
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      appBar: AppBar(
        title: const Text('AsiZ'),
        backgroundColor: Color.fromRGBO(156, 17, 140, 1),
        foregroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),      
      body:  getVista(),
      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
    );
  }


  Center getVista(){
   if(context.watch<TrabajadorProvider>().trabajador.nombre!=""){
     return getVistaVinculado();
   }     
     return getVistaNoVinculado();
  }

  Center getVistaNoVinculado(){
   return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
              children: [
      
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container( width: 300, 
                    height: 100,
                    child:TextButton(onPressed: (){ Navigator.pushNamed(context, '/vincular'); },                
                                   style: TextButton.styleFrom(
                   backgroundColor:  Color.fromRGBO(241, 112, 219, 1),
                   foregroundColor: Color.fromRGBO(93, 1, 77, 1),
                   
                                   ),
                                   child:  Text('Vincular',style: TextStyle(fontSize: 18),)
                                   ) ,
                                   ),
                 )
                 ],
          ),
        );

    
  }


  Center getVistaVinculado(){
    return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(context.read<TrabajadorProvider>().trabajador.nombre,
              style: TextStyle(color: Color.fromRGBO(248, 136, 225, 1),
                  fontSize: 24),
              ),
            ),
      Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container( width: 300, 
                    height: 100,
                    child:TextButton(onPressed: (){ Navigator.pushNamed(context, '/checar'); },                
                                   style: TextButton.styleFrom(
                   backgroundColor:  Color.fromRGBO(241, 112, 219, 1),
                   foregroundColor: Color.fromRGBO(93, 1, 77, 1),
                   
                                   ),
                                   child:  Text('Checar',style: TextStyle(fontSize: 18),)
                                   ) ,
                                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container( width: 300, 
                    height: 100,
                    child:TextButton(onPressed: (){ Navigator.pushNamed(context, '/asistencias'); },                
                                   style: TextButton.styleFrom(
                   backgroundColor:  Color.fromRGBO(241, 112, 219, 1),
                   foregroundColor: Color.fromRGBO(93, 1, 77, 1),
                   
                                   ),
                                   child:  Text('Asistencias',style: TextStyle(fontSize: 18),)
                                   ) ,
                                   ),
                 ),                 
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container( width: 300, 
                    height: 100,
                    child:TextButton(onPressed: (){                                
                                desvincular();
                                 },                
                                   style: TextButton.styleFrom(
                   backgroundColor:  Color.fromRGBO(130, 129, 129, 1),
                   foregroundColor: Color.fromRGBO(237, 236, 236, 1),
                   
                                   ),
                                   child:  Text('Desvincular',style: TextStyle(fontSize: 16),)
                                   ) ,
                                   ),
                 )                
    ],
          ),
        );    
  }

  void desvincular() async{
    

    await BaseDatosControlador.eliminaDatos();
    
    context.read<TrabajadorProvider>().limpiar();
    await ApiCas.desvincular("");
    Mensajeshelper.muestraMensaje(context, "Desvinculado !");
  }


  void prueba() async{
      DateTime ahora=DateTime.now();

      List<AsistenciaItem> lista=await AsistenciaItem.getAsistenciasUltimos30Dias(context.read<TrabajadorProvider>().trabajador);
      Mensajeshelper.muestraMensajeOk(context, "Total: ${lista.length} ${ahora.toLocal().toString().substring(0,10)}");

    }

}