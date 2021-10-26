import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


CollectionReference users = FirebaseFirestore.instance.collection('usuarios');
class registroPage extends StatefulWidget {
  registroPage({Key? key}) : super(key: key);

  @override
  _registroPageState createState() => _registroPageState();
}

class _registroPageState extends State<registroPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String _mail ="";
  String _password = "";
  String _username = "";

  @override
  Widget build(BuildContext context) {

   
      
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
      child:Icon(Icons.backspace),
      onPressed:(){
        Navigator.pushNamed(context, 'Login');
      },
    ) ,
      floatingActionButtonLocation:FloatingActionButtonLocation.startTop,
      
      body:Column(
        children: [
          Container(
            height: 200,
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
  Divider(),
  _crearInputName(),
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
            onPressed:()async{
              try {
              UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: _mail,
                password: _password
              );
              await Alert(context: context, title: "SUCCESS", desc: "Usuario Creado Satisfactoriamente").show();
              
              users
                  .doc(userCredential.user!.uid)
                  .set({
                    'Email': _mail,
                    'Password': _password,
                    'Name': _username,
                  });
              Navigator.pushNamed(context, 'Login');  
            } on FirebaseAuthException catch (e) {
              Alert(context: context, title: "ERROR", desc:"Error en los Datos").show();
              print("$e");
            } 
            },
            child:  Text('Registrarse'),),
      )
      
      
    ]
  )
        ],
      ),
    
      
    );
  }
Widget _crearInputName(){
    return TextField(
      autofocus: false,
      decoration: InputDecoration(
        
        hintText: "Username",
        labelText: "Username",
        helperText: 'Username',
        suffix: Icon(Icons.account_box),
        icon: Icon(Icons.text_format),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0)
        ),
        

      ),
      onChanged: (x){
        setState(() {
          _username = x;
        });
      },
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


// 