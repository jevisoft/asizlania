import 'package:asiz/widgets/BotonCheckIn.dart';
import 'package:flutter/material.dart';

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
            
            
             BotonCheckIn()
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(0, 0, 0, 1)      
      
    );
    
  }

}