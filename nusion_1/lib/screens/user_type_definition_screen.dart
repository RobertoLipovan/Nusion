// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class UserTypeDefinition extends StatelessWidget {
  bool isOptionSelected = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: FractionallySizedBox(
            widthFactor: 1.0, // Expande el contenedor en el eje horizontal
            child: Container(
              margin: EdgeInsets.all(40),
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.purple[200],
                borderRadius: BorderRadius.circular(20),
                boxShadow: List<BoxShadow>.generate(
                  3,
                  (index) => BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: Offset(0, 0),
                  ),
                ),
              ),
              child: Wrap(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          '¿Qué uso le darás a la app?',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  
  void setState(Null Function() param0) {}
}
