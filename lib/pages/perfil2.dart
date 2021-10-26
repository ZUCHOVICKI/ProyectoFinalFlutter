import 'package:flutter/material.dart';
import 'package:proyecto_final/widgets/Nav_bar.dart';
import 'package:proyecto_final/widgets/add_todo.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:Center(
          child:Text("Perfil Page")),
        actions:[
          IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever))
        ],
      ),
      body:_HomePageBody(),
      
      floatingActionButton:Add_todo(),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat,
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
          Text('<<Username>>', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
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
          PasswordField()
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
    bool invisible = true;
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
            initialValue: '<<UserPassword>>',
            enabled: false,
            obscureText: invisible,
          ),
        ),
        IconButton(
          onPressed: (){
            setState(() {
              invisible = !invisible;
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
      initialValue: '<<username>>@gmail.com',
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
      child: CircleAvatar(
        radius: 90,
        backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkSVGs56zxRe9rr7HLUy1YcIb8fhqdGTCXRx1ssWC4C4cUvcnN1oXES6bnI1u11kjMVRQ&usqp=CAU'),
        backgroundColor: Colors.white,
      ),
    );
  }
}