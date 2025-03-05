import 'package:asiz/clases/asistencia_item.dart';
import 'package:asiz/providers/trabajador_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class PantallaAsistencias extends StatelessWidget{
  const PantallaAsistencias({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
        icon: Icon(Icons.arrow_back, color: const Color.fromARGB(255, 229, 228, 228)),
        onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Asistencias'),        
        centerTitle: true,
        backgroundColor: Color.fromRGBO(156, 17, 140, 1),
        foregroundColor: Color.fromRGBO(255, 255, 255, 1),
        ),
      body:FutureBuilder(future: AsistenciaItem.getAsistenciasUltimos30Dias(context.read<TrabajadorProvider>().trabajador), 
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
        }else{

            return _ListaAsistencias(snapshot.data);
        }
       

      }),
      backgroundColor: Color.fromRGBO(0, 0, 0, 1)      
      
    );
    
  }

}

class _ListaAsistencias extends StatelessWidget{
  final List<AsistenciaItem> asistencias;

 const _ListaAsistencias(this.asistencias);

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      itemCount: asistencias.length,
      itemBuilder: (BuildContext context,int index){
       final asis=asistencias[index];
      
       return Container(
      height: 80,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(0),      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.purple[200]
      ),
      child:  ListTile(
        title: Text(asis.fecha),
        subtitle: 
          Text(asis.registros)           
        ,
        trailing: Text(asis.estatus),
      
      )      
    );

    });
  }

}