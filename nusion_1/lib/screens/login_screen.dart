// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nusion_1/screens/signup_screen.dart';
import 'package:nusion_1/screens/user_type_definition_screen.dart';

class LoginScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []); // Añade esta línea
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue, // Cambia el color principal aquí
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple, // Cambia el color principal aquí
        ).copyWith(
          secondary: Colors.blue, // Cambia el color del borde del TextField aquí
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey), // Cambia el color del borde cuando no está enfocado aquí
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple), // Cambia el color del borde cuando está enfocado aquí
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.purple), // Cambia el color de fondo de los botones aquí
            foregroundColor: MaterialStateProperty.all(Colors.white),
            textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), // Cambia el tamaño del texto de los botones aquí
          ),
        ),
      ),
      home: Scaffold(
        // backgroundColor: Colors.blue[200],
        body: Align (
          alignment: Alignment.bottomCenter,
          
        // body: Center(
          child: FractionallySizedBox(
            widthFactor: 1.0, // Expande el contenedor en el eje horizontal
            child: Container(
              padding: EdgeInsets.all(30),
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: List<BoxShadow>.generate(
                  3,
                  (index) => BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: Offset(0, 0),
                  ),
                ),
              ),
              child: Wrap( // Se adapta al contenido en el eje vertical
                children: [
                  Text(
                    'Iniciar sesión',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Container(
                    height: 10,
                  ), 

                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      hintText: 'Correo electrónico',
                      contentPadding: EdgeInsets.all(20),
                    ),
                  ),
                  
                  Container(
                    height: 10,
                  ),

                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      hintText: 'Contraseña',
                      contentPadding: EdgeInsets.all(20),
                    ),
                  ),

                  Container(
                    height: 10,
                  ),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => UserTypeDefinition()),
                      );
                    },
                    child: Text('Iniciar sesión'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),

                  Container(
                    height: 5,
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    child: Text(
                      "Registrarse",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
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