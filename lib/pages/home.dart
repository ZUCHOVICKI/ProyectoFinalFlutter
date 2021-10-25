import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_final/widgets/Nav_bar.dart';
import 'package:proyecto_final/widgets/add_todo.dart';
User? user = FirebaseAuth.instance.currentUser;
CollectionReference Todos = FirebaseFirestore.instance.collection('Todos');
CollectionReference users = FirebaseFirestore.instance.collection('users');


 
class HomePage extends StatelessWidget {
  
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final String documentId;
    return Scaffold(
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:Center(
          child:Text("Home Page")),
        
      ),
      body:_HomePageBody(),
      
      floatingActionButton:Add_todo(),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar:NavigationCustom(indexNum: 0,),
    );
  }
}


class _HomePageBody extends StatefulWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  __HomePageBodyState createState() => __HomePageBodyState();
}

class __HomePageBodyState extends State<_HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      

    child:  FutureBuilder<QuerySnapshot>(
      future: Todos.where('Usuario',isEqualTo: user!.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        
        

        if (snapshot.connectionState == ConnectionState.done) {

           
         
          List returnList =[];
          
          List data = snapshot.data!.docs ;
          
          data.forEach((element) {
            
             returnList.add(element.data());
            //  print(returnList);
          });

          if(returnList.isEmpty){
            
            return Column(
              children: [
                Container( 
                 width: double.infinity,
                 child:Image.asset('assets/empty.jpg')),
                 Center(
                   child: Text("No hay ninguna Tarea",style: GoogleFonts.oswald(textStyle: TextStyle(fontSize: 30)) ),
                 )
              ],
            );
          }
          
             Widget ListGen(){
               
              return Container(
          child: ListView.builder(
              itemCount:returnList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                final item = returnList[index];
               
                
                return Dismissible(
                
                key: Key(item["ID"]),
                
                onDismissed: (direction) {
                  
                   Todos
                  .doc(item["ID"])
                  .delete();
                  
                  // Then show a snackbar.
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('${item["Titulo"]} Eliminado')));

                  returnList.removeAt(index);
                },
                child: ListTile(
                  title: Text(item["Titulo"].toString()),
                  subtitle: Text(item["Texto"].toString()),
                ),
              );
              }));
          }
          return ListGen();
          
        }

        return  GFLoader(
        type: GFLoaderType.circle,
        loaderColorOne: Color.fromRGBO(93, 53, 176, 1),
        loaderColorTwo: Color.fromRGBO(251, 63, 129, 1),
        loaderColorThree: Color.fromRGBO(93, 53, 176, 1) ,
      );
      },
    )
  
    );
  }
}