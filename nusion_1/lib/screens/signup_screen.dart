import 'package:flutter/material.dart';
import 'package:nusion_1/screens/login_screen.dart';

class SignupScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple, // Cambia el color principal aquí
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple, // Cambia el color principal aquí
        ).copyWith(
          secondary: Colors.deepPurple, // Cambia el color del borde del TextField aquí
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
            backgroundColor: MaterialStateProperty.all(Colors.deepPurple), // Cambia el color de fondo de los botones aquí
            foregroundColor: MaterialStateProperty.all(Colors.white),
            textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), // Cambia el tamaño del texto de los botones aquí
          ),
        ),
      ),
      home: Scaffold(
        body: Align(
          alignment: Alignment.bottomCenter,
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
                    'Registrarse',
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
                      hintText: 'Contraseña',
                      contentPadding: EdgeInsets.all(20),
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Registrarse'),
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
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      "Ya tengo una cuenta",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}