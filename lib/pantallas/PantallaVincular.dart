import 'package:flutter/material.dart';
import 'package:asiz/widgets/BotonVincular.dart';

class PantallaVincular extends StatelessWidget{
  const PantallaVincular({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: TextField(decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Codigo',
                hintStyle: TextStyle(color: Color.fromRGBO(161, 161, 161, 1))
              ), 
              style: TextStyle(color: Color.fromRGBO(170, 169, 170, 1)),
               ),
            ),
             BotonVincular()
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(0, 0, 0, 1)      
      
    );
    
  }

}