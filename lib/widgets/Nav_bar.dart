
import 'package:flutter/material.dart';


class NavigationCustom extends StatelessWidget {
  const NavigationCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    
    
    return BottomNavigationBar(
  
      elevation: 0,
      currentIndex: 2,
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
}