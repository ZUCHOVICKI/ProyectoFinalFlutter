import 'package:flutter/material.dart';
import 'package:proyecto_final/widgets/Nav_bar.dart';
import 'package:proyecto_final/widgets/add_todo.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title:Center(
          child:Text("Login Page")),
        actions:[
          IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever))
        ],
      ),
      body:_HomePageBody(),
      
      floatingActionButton:Add_todo(),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar:NavigationCustom(),
    );
  }
}


class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}