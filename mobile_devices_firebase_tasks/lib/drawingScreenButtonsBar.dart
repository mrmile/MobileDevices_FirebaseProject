/*
import 'dart:developer';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_devices_firebase_tasks/firebase_options.dart';

//import 'drawingScreen.dart';

class DrawingScreenButtonsBar extends StatefulWidget
{
  DrawingScreenButtonsBar({super.key, required this.selectedColor, required this.currentColor_R, required this.currentColor_G, required this.currentColor_B, required this.currentColor_A, required this.defaultLineWidth, required this.currentSelectedColor});
  Color selectedColor = Colors.red;
  int currentColor_R = 255;
  int currentColor_G = 244;
  int currentColor_B = 67;
  int currentColor_A = 54;
  int defaultLineWidth = 5;

  int currentSelectedColor = 1;

  @override
  State<DrawingScreenButtonsBar> createState() => _DrawingScreenButtonsBarState();
}

class _DrawingScreenButtonsBarState extends State<DrawingScreenButtonsBar>
{
  set selectedColor(int selectedColor) {}
  set currentColor_R(int currentColor_R) {}
  set currentColor_G(int currentColor_G) {}
  set currentColor_B(int currentColor_B) {}
  set currentColor_A(int currentColor_A) {}
  set defaultLineWidth(int defaultLineWidth) {}

  set currentSelectedColor(int currentSelectedColor) {}

  


  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      body: Center
      (
        child: Stack
        (
          children: <Widget>
          [
            Row
            (
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>
              [
                Column
                (
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>
                    [
                      const SizedBox(height: 100),
                      Container
                      (
                        height: 35.0,
                        width: 35.0,
                        color: Colors.transparent,
                        child: FittedBox
                        (
                          child: FloatingActionButton
                          (
                            backgroundColor: Colors.red,
                            onPressed: ()
                            {
                              currentSelectedColor = 1;
                              setState //this.setState...
                              (() {
                                //selectedColor = Color.fromARGB(255, 244, 67, 54);
                                currentColor_R = 255;
                                currentColor_G = 244;
                                currentColor_B = 67;
                                currentColor_A = 54;
                              });
                            },
                            child: Container
                            (
                              decoration: BoxDecoration
                              (
                                color: Colors.transparent,
                                borderRadius: const BorderRadius.all
                                (
                                  Radius.circular(100),
                                ),
                                boxShadow:
                                [
                                  if (currentSelectedColor == 1)
                                  (
                                    BoxShadow
                                    (
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 7,
                                      blurRadius: 7,
                                      offset: const Offset(0, 0),
                                    )
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container
                      (
                        height: 35.0,
                        width: 35.0,
                        color: Colors.transparent,
                        child: FittedBox
                        (
                          child: FloatingActionButton
                          (
                            backgroundColor: Colors.blue,
                            onPressed: ()
                            {
                              currentSelectedColor = 2;
                              setState //this.setState...
                              (() {
                                //selectedColor = Color.fromARGB(255, 33, 150, 243);
                                currentColor_R = 255;
                                currentColor_G = 33;
                                currentColor_B = 150;
                                currentColor_A = 243;
                              });
                            },
                            child: Container
                            (
                              decoration: BoxDecoration
                              (
                                color: Colors.transparent,
                                borderRadius: const BorderRadius.all
                                (
                                  Radius.circular(100),
                                ),
                                boxShadow:
                                [
                                  if (currentSelectedColor == 2)
                                  ( BoxShadow
                                    (
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 7,
                                      blurRadius: 7,
                                      offset: const Offset(0, 0),
                                    )
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container
                      (
                        height: 35.0,
                        width: 35.0,
                        color: Colors.transparent,
                        child: FittedBox
                        (
                          child: FloatingActionButton
                          (
                            backgroundColor: Colors.orange,
                            onPressed: ()
                            {
                              currentSelectedColor = 3;
                              setState //this.setState...
                              (() {
                                //selectedColor = Color.fromARGB(255, 255, 152, 0);
                                currentColor_R = 255;
                                currentColor_G = 255;
                                currentColor_B = 152;
                                currentColor_A = 0;
                              });
                            },
                            child: Container
                            (
                              decoration: BoxDecoration
                              (
                                color: Colors.transparent,
                                borderRadius: const BorderRadius.all
                                (
                                  Radius.circular(100),
                                ),
                                boxShadow:
                                [
                                  if (currentSelectedColor == 3)
                                  ( BoxShadow
                                    (
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 7,
                                      blurRadius: 7,
                                      offset: const Offset(0, 0),
                                    )
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container
                      (
                        height: 35.0,
                        width: 35.0,
                        color: Colors.transparent,
                        child: FittedBox
                        (
                          child: FloatingActionButton
                          (
                            backgroundColor: Colors.green,
                            onPressed: ()
                            {
                              currentSelectedColor = 4;
                              setState //this.setState...
                              (() {
                                //selectedColor = Color.fromARGB(255, 76, 175, 80);
                                currentColor_R = 255;
                                currentColor_G = 76;
                                currentColor_B = 175;
                                currentColor_A = 80;
                              });
                            },
                            child: Container
                            (
                              decoration: BoxDecoration
                              (
                                color: Colors.transparent,
                                borderRadius: const BorderRadius.all
                                (
                                  Radius.circular(100),
                                ),
                                boxShadow:
                                [
                                  if (currentSelectedColor == 4)
                                  ( BoxShadow
                                    (
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 7,
                                      blurRadius: 7,
                                      offset: const Offset(0, 0),
                                    )
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container
                      (
                        height: 35.0,
                        width: 35.0,
                        color: Colors.transparent,
                        child: FittedBox
                        (
                          child: FloatingActionButton
                          (
                            backgroundColor: Colors.yellow,
                            onPressed: ()
                            {
                              currentSelectedColor = 5;
                              setState //this.setState...
                              (() {
                                //selectedColor = Color.fromARGB(255, 255, 235, 59);
                                currentColor_R = 255;
                                currentColor_G = 255;
                                currentColor_B = 235;
                                currentColor_A = 59;
                              });
                            },
                            child: Container
                            (
                              decoration: BoxDecoration
                              (
                                color: Colors.transparent,
                                borderRadius: const BorderRadius.all
                                (
                                  Radius.circular(100),
                                ),
                                boxShadow:
                                [
                                  if (currentSelectedColor == 5)
                                  ( BoxShadow
                                    (
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 7,
                                      blurRadius: 7,
                                      offset: const Offset(0, 0),
                                    )
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container
                      (
                        height: 35.0,
                        width: 35.0,
                        color: Colors.transparent,
                        child: FittedBox
                        (
                          child: FloatingActionButton
                          (
                            backgroundColor: Colors.black,
                            onPressed: ()
                            {
                              currentSelectedColor = 6;
                              setState //this.setState...
                              (() {
                                //selectedColor = Color.fromARGB(255, 0, 0, 0);
                                currentColor_R = 255;
                                currentColor_G = 0;
                                currentColor_B = 0;
                                currentColor_A = 0;
                              });
                            },
                            child: Container
                            (
                              decoration: BoxDecoration
                              (
                                color: Colors.transparent,
                                borderRadius: const BorderRadius.all
                                (
                                  Radius.circular(100),
                                ),
                                boxShadow:
                                [
                                  if (currentSelectedColor == 6)
                                  (
                                    BoxShadow
                                    (
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 7,
                                      blurRadius: 7,
                                      offset: const Offset(0, 0),
                                    )
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container
                      (
                        height: 35.0,
                        width: 35.0,
                        color: Colors.transparent,
                        child: FittedBox
                        (
                          child: FloatingActionButton
                          (
                            backgroundColor: Colors.white,
                            onPressed: ()
                            {
                              currentSelectedColor = 7;
                              setState //this.setState...
                              (() {
                                //selectedColor = Color.fromARGB(255, 255, 255, 255);
                                currentColor_R = 255;
                                currentColor_G = 255;
                                currentColor_B = 255;
                                currentColor_A = 255;
                              });
                            },
                            child: Container
                            (
                              decoration: BoxDecoration
                              (
                                color: Colors.transparent,
                                borderRadius: const BorderRadius.all
                                (
                                  Radius.circular(100),
                                ),
                                boxShadow:
                                [
                                  if (currentSelectedColor == 7)
                                  ( BoxShadow
                                    (
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 7,
                                      blurRadius: 7,
                                      offset: const Offset(0, 0),
                                    )
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                const SizedBox(width: 25),
              ],
            )
          ]
        ),
      )
    );
  }
}
*/