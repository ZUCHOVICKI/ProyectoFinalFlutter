import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_final/widgets/Nav_bar.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

String horaAlarma ="";
DateTime now = DateTime.now();


class NotificacionesPage extends StatelessWidget {
 
  const NotificacionesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:Center(
          child:Text("Notificación Page")),
        
      ),
      body:_HomePageBody(),
      
      
      bottomNavigationBar:NavigationCustom(indexNum: 1,),
    );
  }
}


class _HomePageBody extends StatefulWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  __HomePageBodyState createState() => __HomePageBodyState();
}

class __HomePageBodyState extends State<_HomePageBody> {
   
  TimeOfDay _time = TimeOfDay.now();

  

  void _selectTime() async {
    DateTime now = DateTime.now();
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
       
      });
      // DateTime finalHour = _time as DateTime;

      print(new DateTime(now.year,now.month,now.day,_time.hour,_time.minute));
      print(_time.hour);
      
      
      if(_time.hour<TimeOfDay.now().hour){
        _ringAlarm(new DateTime(now.year,now.month,now.day+1,_time.hour,_time.minute),context);
      }else{
        _ringAlarm(new DateTime(now.year,now.month,now.day,_time.hour,_time.minute),context);
      }
      

      
      Alert(context: context, title: "Alarma", desc: "Alarma Configurada para las ${_time.format(context)}").show();
      horaAlarma = _time.format(context);
      setState(() {
        _time = TimeOfDay.now();
       
      });
      horaAlarma = _time.format(context);
    }
    
  }
  @override
  Widget build(BuildContext context) {
    return Container(
     child :Center(
       child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              ElevatedButton(
                onPressed: _selectTime,
                child: Text('SELECT TIME'),
              ),
              SizedBox(height: 50),
              Text(
                'Alarma configurada para :  $horaAlarma',style: GoogleFonts.oswald(textStyle: TextStyle(fontSize: 30)) 
              ),
            ],
          ),
     ),
);
    
  }
}





Future _ringAlarm(DateTime finalhour, BuildContext context) async {

  AwesomeNotifications().initialize(
    null,
    [
        NotificationChannel(
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xFF9D50DD),
            ledColor: Colors.white,
        )
    ]
  );

  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });
 String timezone = await AwesomeNotifications().getLocalTimeZoneIdentifier();
 //get time zone you are in
  AwesomeNotifications().createNotification(
    content: NotificationContent(
        id: 10,
        channelKey: 'basic_channel',
        title: 'El tiempo se ha acabado',
        body: 'Regresa a HomeWork Planner ya !!!',
        displayOnBackground: true
    ),
    schedule: NotificationCalendar.fromDate(date: finalhour));
  
  AwesomeNotifications().actionStream.listen((receivedNotifiction)
{
                                    Navigator.of(context).pushNamed(
                    'Home',
                  );
});
  
}