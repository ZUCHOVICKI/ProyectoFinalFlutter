import 'package:flutter/material.dart';
import 'package:proyecto_final/widgets/Nav_bar.dart';
import 'package:proyecto_final/widgets/add_todo.dart';

class TareaPage extends StatelessWidget {
  const TareaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title:Center(
          child:Text("Tarea Page")),
        actions:[
          IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever))
        ],
      ),
      body:_HomePageBody(),
      
      floatingActionButton:Add_todo(),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat,
      // bottomNavigationBar:NavigationCustom(),
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