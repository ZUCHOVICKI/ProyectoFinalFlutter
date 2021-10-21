import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:proyecto_final/pages/home.dart';
import 'package:proyecto_final/pages/login.dart';
import 'package:proyecto_final/pages/notificacion.dart';
import 'package:proyecto_final/pages/perfil.dart';
import 'package:proyecto_final/pages/tarea.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'Home',
      routes: {
        'Home': (BuildContext context) => HomePage(),
        'Tarea': (BuildContext context) => TareaPage(),
        'Perfil': (BuildContext context) => PerfilPage(),
        'Login': (BuildContext context) => LoginPage(),
        'Notificacion': (BuildContext context) => NotificacionesPage(),
      },
      theme: ThemeData(
          primaryColor: Color.fromRGBO(93, 53, 176, 1),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Color.fromRGBO(93, 53, 176, .9),
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            elevation: 0,
            backgroundColor: Color.fromRGBO(251, 63, 129, 1),
          )),
    );
  }
}
