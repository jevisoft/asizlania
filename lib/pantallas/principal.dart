
import 'package:flutter/material.dart';

class PantallaPrincipal extends StatelessWidget {
  const PantallaPrincipal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      appBar: AppBar(
        title: const Text('AsiZ'),
        backgroundColor: Color.fromRGBO(156, 17, 140, 1),
        foregroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body:  Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
              children: [
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
                    child:TextButton(onPressed: (){ Navigator.pushNamed(context, '/vincular'); },                
                                   style: TextButton.styleFrom(
                   backgroundColor:  Color.fromRGBO(241, 112, 219, 1),
                   foregroundColor: Color.fromRGBO(93, 1, 77, 1),
                   
                                   ),
                                   child:  Text('Vincular',style: TextStyle(fontSize: 18),)
                                   ) ,
                                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container( width: 300, 
                    height: 100,
                    child:TextButton(onPressed: (){  },                
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
        ),
      
        
      
      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
    );
  }



}