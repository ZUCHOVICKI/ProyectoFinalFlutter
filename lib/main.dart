import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/getwidget.dart';
import 'package:proyecto_final/pages/home.dart';
import 'package:proyecto_final/pages/login.dart';
import 'package:proyecto_final/pages/notificacion.dart';
import 'package:proyecto_final/pages/perfil.dart';
import 'package:proyecto_final/pages/registro.dart';
import 'package:proyecto_final/pages/tarea.dart';

import 'package:firebase_core/firebase_core.dart';


void main() {

  WidgetsFlutterBinding.ensureInitialized();
   
  runApp(MyApp());
  
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {

  

  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    
    
   if(_error) {
      return Text("Error While loading Firebase");
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return GFLoader(
        type: GFLoaderType.circle,
        loaderColorOne: Color.fromRGBO(93, 53, 176, 1),
        loaderColorTwo: Color.fromRGBO(251, 63, 129, 1),
        loaderColorThree: Color.fromRGBO(93, 53, 176, 1) ,
      );
    }
   
   
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'Login',
      routes: {
        
        'Home': (BuildContext context) => HomePage(),
        'Tarea': (BuildContext context) => TareaPage(),
        'Perfil': (BuildContext context) => PerfilPage(),
        'Login': (BuildContext context) => LoginPage(),
        'Notificacion': (BuildContext context) => NotificacionesPage(),
        'Registro':(BuildContext context) => registroPage()
      },
      theme: ThemeData(
          primaryColor: Color.fromRGBO(93, 53, 176, 1),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Color.fromRGBO(93, 53, 176, .9),
            // selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            elevation: 0,
            backgroundColor: Color.fromRGBO(251, 63, 129, 1),
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Color.fromRGBO(251, 63, 129, 1)
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color.fromRGBO(251, 63, 129, 1))
            )
          )),
    );
  }
  
}

