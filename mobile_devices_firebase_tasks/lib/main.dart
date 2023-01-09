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

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

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
      home: const MyHomePage(title: 'PaintScreen'),
    );
  }
}

class MyHomePage extends StatefulWidget
{
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{


  @override
  Widget build(BuildContext context)
  {
    
    return Scaffold
    (
      body: Stack
      (
        children:
        [
          
          Column
          (
            children: const
            [
              //Expanded(flex: 1, child: RoomScreen()), Not created yet
              Expanded(flex: 3, child: DrawingScreen()),
              //Expanded(flex: 2, child: ChatScreen()), Not created yet
            ],
          ),
        ],
      ),
    );
    
  }
}