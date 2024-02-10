// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

class UserTypeDefinition extends StatefulWidget {
  @override
  _UserTypeDefinitionState createState() => _UserTypeDefinitionState();
}

class _UserTypeDefinitionState extends State<UserTypeDefinition> {
  int _groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        

        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.purple],
            ),
          ),
          child: Center(
            child: FractionallySizedBox(

              widthFactor: 1.0, // Expande el contenedor en el eje horizontal
              child: Container(
                margin: EdgeInsets.all(40),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
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

                          SizedBox(height: 10),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RadioListTile(
                              value: 0,
                              groupValue: _groupValue,
                              title: Text('Personal'),
                              onChanged: (int? value) {
                                setState(() {
                                  _groupValue = value!;
                                });
                              },
                            ),
                            RadioListTile(
                              value: 1,
                              groupValue: _groupValue,
                              title: Text('Comercial'),
                              onChanged: (int? value) {
                                setState(() {
                                  _groupValue = value!;
                                });
                              },
                            ),
                            ],
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
      ),
    );
  }
}


