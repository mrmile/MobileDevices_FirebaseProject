//import 'dart:ffi'; //Gives some errors - because of repeated declarations?
import 'dart:developer';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_devices_firebase_tasks/firebase_options.dart';

import 'drawingScreen.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp
  (
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget
{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  //const MyApp({super.key});

  List<Room> rooms = [];

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData
      (
        primarySwatch: Colors.blue,
      ),
      //home: const MyHomePage(title: 'PaintScreen'),

      routes:
      {
        '/': (context) => MyHomePage
        (
          rooms: rooms,
        ),
        '/drawing': (context) => DrawingScreen
        (
          rooms: rooms,
        ),
        //'/chat': (context) => ChatScreen
        //(
        //  //tables: tables,
        //),
      },
    );
  }
}

class Room
{
  final int roomNumber;
  final int ID;

  Room(this.roomNumber, this.ID);
}

class MyHomePage extends StatefulWidget
{
  MyHomePage
  ({
    Key? key,
    required this.rooms,
  }) : super(key: key);

  List<Room> rooms = [];

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{
  int lastID = 0;
  List<Room> rooms = [];

  @override
  Widget build(BuildContext context)
  {
    if(rooms.length < 6)
    {
      for(int i = 1; i <= 6; i++)
      {
        rooms.add(Room(i, ++lastID));
      }
    }
    return Scaffold
    (
      
      backgroundColor: Color.fromARGB(255, 140, 179, 160),

      appBar: AppBar
      (
        centerTitle: true,
        title: const Text("expressART", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Color.fromARGB(255, 255, 249, 216),
      ),
      body: ListView.builder
      (
        itemCount: rooms.length,

        itemBuilder: (context, index)
        {
          final room = rooms[index];

          return ListTile
          (
            leading: const CircleAvatar
            (
              backgroundImage: NetworkImage
              (
                "https://www.google.com/url?sa=i&url=https%3A%2F%2Fsalmorejogeek.com%2F2019%2F05%2F31%2Fcomo-cambiar-al-color-negro-el-icono-de-telegram-en-ios%2F&psig=AOvVaw3CPHfUqu9CLLtH3h_hXNYu&ust=1674764714750000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCPCM_fPG4_wCFQAAAAAdAAAAABAg",
                scale: 1,
              ),
              //backgroundImage: NetworkImage("https://www.google.com/url?sa=i&url=https%3A%2F%2Ficones.pro%2Fes%2Ficono-de-hoja-verde-simbolo-png%2F&psig=AOvVaw3CPHfUqu9CLLtH3h_hXNYu&ust=1674764714750000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCPCM_fPG4_wCFQAAAAAdAAAAABAb"),
            ),
            title: Text("Room ${room.roomNumber}"),

            onTap: ()
            {
              Navigator.of(context).pushNamed
              (
                '/drawing',
                arguments: room.roomNumber,
              );
            }
          );
        }
      )
    );
  }
}