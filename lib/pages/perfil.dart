import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_final/widgets/Nav_bar.dart';


bool invisible = true;
User? user = FirebaseAuth.instance.currentUser;
String correo = "";
String password = "";
String username = "x";


class PerfilPage extends StatelessWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     
     //Listener de Firebase Authentication
    FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) {
        if (user == null) {
          correo = "";
          password = "";
          username = "";
          Navigator.pushNamed(context, "Login");
        }else{
          //Query a Base de Datos sobre Usuarios
          CollectionReference users = FirebaseFirestore.instance.collection('usuarios');
          users.doc(user.uid).get()
          .then((DocumentSnapshot documentSnapshot) {
          correo = documentSnapshot["Email"];
          password = documentSnapshot["Password"];
          username = documentSnapshot["Name"];
          
          });
        }
      });
    return Scaffold(
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:Center(
          child:Text("Perfil Page")),
        
      ),
      body:_HomePageBody(),
      
      
      bottomNavigationBar: NavigationCustom(indexNum: 2,),
    );
  }
}


class _HomePageBody extends StatelessWidget {
  
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfilePic(),
          SizedBox(height: 20,),
          Text('$username', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          SizedBox(height: 20,),
          UserInfo()
        ],
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          EmailField(), 
          SizedBox(height: 20,),
          PasswordField(),
          SizedBox(height: 20,),
          ElevatedButton(
                onPressed: ()async{
                  await FirebaseAuth.instance.signOut();
                },
                child: Text('Log Out'),
          )
        ],
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    Key? key,
  }) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    
    return Row(
      children: [
        Flexible(
          child: TextFormField(
            decoration: InputDecoration(
              labelStyle: TextStyle(
                color: Color.fromRGBO(93, 53, 176, 1),
              ),
              labelText: 'Contraseña',
            ),
            initialValue: '$password',
            enabled: false,
            obscureText: invisible,
          ),
        ),
        IconButton(
          onPressed: (){
            setState(() {
              invisible = !invisible;
              print(invisible);
            });
          }, 
          icon: Icon(invisible == true ? Icons.visibility : Icons.visibility_off)
        )
        
      ],
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Color.fromRGBO(93, 53, 176, 1),
        ),
        labelText: 'Correo electrónico',

      ),
      initialValue: '$correo',
      enabled: false,
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Color.fromRGBO(93, 53, 176, 1),
      radius: 100,
      child: Text("${username[0].toUpperCase()}",style: GoogleFonts.oswald(textStyle: TextStyle(fontSize: 100)))
    );
  }
}