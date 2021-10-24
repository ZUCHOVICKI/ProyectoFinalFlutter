
import 'package:flutter/material.dart';


class NavigationCustom extends StatefulWidget {
  final int  indexNum;
  const NavigationCustom({Key? key, required this.indexNum}) : super(key: key);

  @override
  _NavigationCustomState createState() => _NavigationCustomState();
}

class _NavigationCustomState extends State<NavigationCustom> {


  int currentindex = 0;
 
  
   
  Widget build(BuildContext context) {
    
     currentindex = widget.indexNum;
    
    return BottomNavigationBar(
      
      onTap: _opcionCheck,
      elevation: 0,
      currentIndex: currentindex,
      items:[
        BottomNavigationBarItem(
          icon:Icon(Icons.task),
          label:'Home'
          
        ),
        BottomNavigationBarItem(
          icon:Icon(Icons.alarm),
          label:'Notification'
        ),
        BottomNavigationBarItem(
          icon:Icon(Icons.person),
          label:'Perfil'
        ),
        
      ]
    );
  }

  void _opcionCheck(int opcion){

    switch (opcion) {
      case 0 :
        currentindex = 0;
        setState(() {
          
        });
        Navigator.pushNamed(context, 'Home');
        break;
      case 1 :
        currentindex = 1;
        setState(() {
          
        });
        Navigator.pushNamed(context, 'Notificacion');
        break;

      case 2 :
        currentindex = 2;
        setState(() {
          
        });
        Navigator.pushNamed(context, 'Perfil');
        break;
      default:
    }

    
  }
}