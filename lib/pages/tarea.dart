import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_final/widgets/addTodoFirebase.dart';

String _titulo = "";
String _texto = "";
class TareaPage extends StatefulWidget {
  const TareaPage({Key? key}) : super(key: key);

  @override
  _TareaPageState createState() => _TareaPageState();
}

class _TareaPageState extends State<TareaPage> {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: addToDo(titulo: _titulo,texto: _texto),
      appBar: AppBar(
        title:Center(
          child:Text("Tarea Page")),
        actions:[
          IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever))
        ],
      ),
      body: Container(
      
      child: Column(
        
        children: [
          Center(child: Text("Agregar Tarea",style: GoogleFonts.oswald(textStyle: TextStyle(fontSize: 30)) ),),
          SizedBox(height: 100,),
          _inputTitulo(),
          Divider(), 
          SizedBox(height: 50,),
          _inputTexto(),
          
        ],
        
      ),
    )
    );
  }

   Widget _inputTitulo(){
    return TextField(
      autofocus: false,
      decoration: InputDecoration(
        
        hintText: "Titulo",
        labelText: "Titulo",
        helperText: 'Titulo',
        suffix: Icon(Icons.text_format_sharp),
        icon: Icon(Icons.text_format),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0)
        ),
        

      ),
      onChanged: (x){
        setState(() {
          _titulo = x;
        });
      },
    );
  }


  Widget _inputTexto(){
    return TextField(
      autofocus: false,
      decoration: InputDecoration(
        
        hintText: "Texto",
        labelText: "Texto",
        helperText: 'Texto',
        suffix: Icon(Icons.format_list_bulleted_rounded),
        icon: Icon(Icons.format_list_bulleted_rounded),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0)
        ),
        

      ),
      onChanged: (x){
        setState(() {
          _texto = x;
        });
      },
    );
  
      
      
      
    
  
}
}


