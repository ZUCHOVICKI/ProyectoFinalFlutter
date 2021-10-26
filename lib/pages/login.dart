

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/getwidget.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

User? user = FirebaseAuth.instance.currentUser;


class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  

 User? user = FirebaseAuth.instance.currentUser;

  String _mail =" ";
  String _password = " ";

  @override
  Widget build(BuildContext context) {
    print(user);
      

    return Scaffold(
      resizeToAvoidBottomInset: false,
      
      body:Column(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            decoration: BoxDecoration(
            color: Color.fromRGBO(93, 53, 176, 1),
            
             ),
            child: Center(
           child: Container( 
             width: double.infinity,
             child:Image.asset('assets/logo.png')
             ),
  ),
),
  SizedBox(height: 50,),
  _crearInput(),
  Divider(),
   _crearInputPassword(),
  SizedBox(height: 50,),
  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children:[


      Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        width: 150,
        height: 50,
        
        child: ElevatedButton(
            style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.white)),
            onPressed:() async {
              try {
               
                 UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: _mail,
                    password: _password
                  );

                  

                  print(user);
                  Navigator.pushNamed(context, "Home");
                } on FirebaseAuthException catch (e) {
                  
                  
                    Alert(context: context, title: "ERROR", desc: "Error en los Datos").show();
                    print('$e');
                    
                  
                }
            },
            child:  Text('Iniciar'),),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        width: 150,
        height: 50,
        
        child: ElevatedButton(
            style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.white)),
            onPressed:(){
              Navigator.pushNamed(context, 'Registro');
            },
            child:  Text('Registrarse'),),
      )
      // loginButton(name: "Registrarse")
    ]
  )
        ],
      ),
    
      
    );
  }


Widget _crearInput(){
    return TextField(
      autofocus: false,
      decoration: InputDecoration(
        
        hintText: "Email",
        labelText: "Email",
        helperText: 'Email',
        suffix: Icon(Icons.email),
        icon: Icon(Icons.text_format),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0)
        ),
        

      ),
      onChanged: (x){
        setState(() {
          _mail = x;
        });
      },
    );
  }

  Widget _crearInputPassword(){
    return TextField(
      autofocus: false,
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        
        hintText: "Password",
        labelText: "Password",
        helperText: 'Password',
        suffix: Icon(Icons.password),
        icon: Icon(Icons.lock),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0)
        ),
        

      ),
      onChanged: (x){
        _password = x;
      },
    );
  }

}



 