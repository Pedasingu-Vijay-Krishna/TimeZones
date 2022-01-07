import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:time/time.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',

      theme: ThemeData(

        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Clock'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _timeString= "";
  String _sydney= "";
  String _dubai= "";
  String _singapore= "";
  String _masocw= "";
  String _bangkok= "";
  String _date= "";

  @override
  void initState() {

    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        title: TitleText(widget.title),
        backgroundColor: Colors.black45,
        actions: [Icon(CupertinoIcons.ellipsis_vertical)],
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Center(
            child: Text(_timeString.toString(),style: TextStyle(fontSize: 30,color: Colors.blueAccent,fontWeight: FontWeight.bold)),
          ),

          SizedBox(height: 20,),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_date,style: TextStyle(fontSize: 18,color: Colors.white),),
            ),
          ),



          Divider(thickness: 1.0,color: Colors.white60,),


          CommonView("Sydney", "4 hrs 30 min ahead", _sydney.toString()),





          CommonView("Dubai" ,"1 hrs 30 min behind", _dubai.toString()),


          CommonView("Singapore","2 hrs30 min ahead" , _singapore.toString()) ,



          CommonView("Moscow", "2 hrs30 min behind", _masocw.toString()),


          CommonView("Bangkok", "2 hrs30 min ahead", _bangkok.toString()),
        ],
      ),
    );
  }

  Widget TitleText(String text){


    return   Text(text,style: TextStyle(color: Colors.white,fontSize: 24),);

  }

  Widget SubTitleText(String text){


    return   Text(text,style: TextStyle(color: Colors.white70),);

  }


  Widget CommonView(String t1, String t2 , String t3){

    return    Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText(t1),
                SizedBox(height: 5,),
                SubTitleText(t2),
              ],
            ),
            TitleText(t3)
          ],
        ),
      ),
    );

  }


  void _getTime() {
    final DateTime now = DateTime.now();

    var dateFormatnow = DateFormat.jm();
    var dateFormat = DateFormat("hh:mm a");

    var datetoday = DateFormat('E,d MMM ').format(now); // you can change the format here
    print(dateFormat.format(now));
   setState(() {
     _date = datetoday;

     print(_date);
     _timeString =dateFormatnow.format(now);
      _sydney = dateFormat.format(now.add(Duration(hours: 4,minutes: 40)));
      _dubai = dateFormat.format(now.add(Duration(hours: 1,minutes: 30)));
      _singapore = dateFormat.format(now.add(Duration(hours: 2,minutes: 30)));
      _masocw = dateFormat.format(now.add(Duration(hours: 2,minutes: 30)));
      _bangkok = dateFormat.format(now.add(Duration(hours: 2,minutes: 30)));
    });
  }

}