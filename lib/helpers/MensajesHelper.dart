import 'package:flutter/material.dart';

class Mensajeshelper {

   static void muestraMensaje(BuildContext context,String mensaje){
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mensaje, style: TextStyle(color: Colors.black),),
       shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
           
       ),
       behavior: SnackBarBehavior.floating,
       backgroundColor: const Color.fromARGB(255, 231, 237, 238),
       
      ));
   }

   static void muestraMensajeError(BuildContext context,String mensaje){
     showDialog(context: context, builder: (context)=> AlertDialog(
        actions: [ElevatedButton(onPressed: (){
             Navigator.of(context).pop();
        },
                style:ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white
                ), 
                child: const Text('Ok'))],
        title: const Text('Error'),
        content: SingleChildScrollView(
          child: ListBody(
            children: [Text(mensaje)],
          ),
        ),
     ));
   }

   static void muestraMensajeOk(BuildContext context,String mensaje){
     showDialog(context: context, builder: (context)=> AlertDialog(
        actions: [ElevatedButton(onPressed: (){
             Navigator.of(context).pop();
        },
                style:ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white
                ), 
                child: const Text('Ok'))],
        title: const Text('Ok !'),
        content: SingleChildScrollView(
          child: ListBody(
            children: [Text(mensaje)],
          ),
        ),
     ));
   }

}