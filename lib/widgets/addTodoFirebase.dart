import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
User? user = FirebaseAuth.instance.currentUser;


class addToDo extends StatelessWidget {
  final titulo;
  final texto;
  const addToDo({Key? key, this.titulo, this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: (){
        if(titulo==""){
          Alert(context: context, title: "ERROR", desc: "Campos Incompletos").show();
        }else{
            CollectionReference users = FirebaseFirestore.instance.collection('Todos');
            final idFirebase = users.doc().id;
               users
                  .doc(idFirebase)
                  .set({
                    'Usuario':user!.uid,
                    'Titulo': titulo, 
                    'Texto': texto, 
                    "ID":idFirebase
                   
                  }
                 )
                  .then((value) => print("Todo Added"))
                  .catchError((error) => print("Failed to add todo: $error"));

                  Navigator.pushNamed(context, "Home");
        }
      }, );
  }
}