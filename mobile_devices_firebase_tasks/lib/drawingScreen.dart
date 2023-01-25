import 'dart:developer';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_devices_firebase_tasks/firebase_options.dart';

//import 'drawingScreenButtonsBar.dart';
import 'main.dart';

class DrawingScreen extends StatefulWidget
{
  DrawingScreen({super.key, required this.rooms});
  List<Room> rooms = [];

  @override
  State<DrawingScreen> createState() => _DrawingScreenState();
}

class DrawingBrush
{
  Offset point = const Offset(0, 0);
  Paint brushPaint = Paint();

  DrawingBrush(this.point, this.brushPaint);
}

class DrawingBrushAdapted
{
  double offsetPoint_X = 0;
  double offsetPoint_Y = 0;


  int color_R = 255;
  int color_G = 0;
  int color_B = 0;
  int color_A = 255;

  int lineWidth = 5;


  DrawingBrushAdapted(this.offsetPoint_X, this.offsetPoint_Y, this.color_R, this.color_G, this.color_B, this.color_A, this.lineWidth);
}

class _DrawingScreenState extends State<DrawingScreen>
{
  List<DrawingBrushAdapted?> points = [];

  Color selectedColor = Colors.red;
  int currentColor_R = 255;
  int currentColor_G = 244;
  int currentColor_B = 67;
  int currentColor_A = 54;
  int defaultLineWidth = 5;

  int currentSelectedColor = 1;

  double poss_X = 0;
  double poss_Y = 0;

  int currentRoom = 0;
  bool loadedDrawing = false;

  //DrawingBrush currentBrush = DrawingBrush({0,0}, Paint() ..color = Colors.black ..strokeCap = StrokeCap.round ..strokeWidth = 2.0);

  @override
  void initState()
  {
    super.initState();
    //_loadFromFirestone();
  }


  @override
  Widget build(BuildContext context)
  {
    final room_number = ModalRoute.of(context)!.settings.arguments as int;
    currentRoom = room_number;
    final double referenceWidth = MediaQuery.of(context).size.width;
    final double referenceHeight = MediaQuery.of(context).size.height;
    if(loadedDrawing == false)
    {
      _loadFromFirestone();
      loadedDrawing = true;
    }
    return Scaffold
    (
      body: Center
      (
        child: Stack
        (
          //mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>
          [
            Container
            (
              
              width: referenceWidth * 0.99,
              height: referenceHeight * 0.99,
              color: const Color.fromARGB(255, 255, 254, 223),
              child: GestureDetector
              (
                onPanDown: (details)
                {
                  setState //this.setState...
                  (() {
                    //points.add(DrawingBrush(details.localPosition, Paint() ..color = selectedColor ..strokeCap = StrokeCap.round ..strokeWidth = 2.0));
                    poss_X = details.localPosition.dx;
                    poss_Y = details.localPosition.dy;
                    points.add(DrawingBrushAdapted(poss_X, poss_Y, currentColor_R, currentColor_G, currentColor_B, currentColor_A, defaultLineWidth));
                  });
                },
                onPanUpdate: (details)
                {
                  setState //this.setState...
                  (() {
                    //points.add(DrawingBrush(details.localPosition, Paint() ..color = selectedColor ..strokeCap = StrokeCap.round ..strokeWidth = 2.0));
                    poss_X = details.localPosition.dx;
                    poss_Y = details.localPosition.dy;
                    points.add(DrawingBrushAdapted(poss_X, poss_Y, currentColor_R, currentColor_G, currentColor_B, currentColor_A, defaultLineWidth));
                  });
                },
                onPanEnd: (details)
                {
                  setState(()
                  {
                    points.add(null);
                    _saveToFirestore();
                  });
                },
                child: CustomPaint
                (
                  painter: CustomPainterWidged(pointsPass: points),
                ),
              ),
            ),
            
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
                      //Expanded(flex: 3, child: DrawingScreenButtonsBar()),
                      
                      Container
                      (
                        height: 35.0,
                        width: 35.0,
                        color: Colors.transparent,
                        child: FittedBox
                        (
                          child: FloatingActionButton
                          (
                            heroTag: "btn1",
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
                            heroTag: "btn2",
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
                            heroTag: "btn3",
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
                            heroTag: "btn4",
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
                            heroTag: "btn5",
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
                            heroTag: "btn6",
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
                            heroTag: "btn7",
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
                      const SizedBox(height: 50),
                      
                      Container
                      (
                        height: 35.0,
                        width: 35.0,
                        color: Colors.transparent,
                        child: FittedBox
                        (
                          child: FloatingActionButton
                          (
                            heroTag: "btn8",
                              backgroundColor: Colors.white,
                              child:
                                  const Icon(Icons.delete, color: Colors.grey),
                              onPressed: ()
                              {
                                _deleteFromFirestore();
                                points.clear();
                              }),
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
                            heroTag: "btn9",
                              backgroundColor: Colors.white,
                              child: const Icon(Icons.chat_bubble, color: Colors.blue),
                              onPressed: ()
                              {
                                // Will take you to the chat screen
                              }),
                        ),
                      ),
                    ]),
                const SizedBox(width: 25),
              ],
            )
            
          ],
        ),
      ),
    );
  }

  void _saveToFirestore() async
  {
    if(currentRoom != 0)
    {
      final db = FirebaseFirestore.instance;
      final batch = db.batch();
      final linesRef = db.collection("/Rooms/room_$currentRoom/drawing_lines");
      // Per tots els punts
      for(int x = 0; x < points.length - 1; x++)
      {
        if(points[x] != null)
        {
          batch.set(linesRef.doc("$x"), { "a": points[x]!.color_A, "r": points[x]!.color_R, "g": points[x]!.color_G, "b": points[x]!.color_B, "width": points[x]!.lineWidth, "x": points[x]!.offsetPoint_X, "y": points[x]!.offsetPoint_Y, "id": x });
        }
      }

      //[cloud_firestore/invalid-argument] maximum 500 writes allowed per request
      //Happens when making lots of commits wich happens often since drawing requires commiting lots of points
      await batch.commit();
    }
  }

  void _deleteFromFirestore() async
  {
    if(currentRoom != 0)
    {
      final db = FirebaseFirestore.instance;
      final batch = db.batch();
      final linesRef = db.collection("/Rooms/room_$currentRoom/drawing_lines");
      // Per tots els punts
      for(int x = 0; x < points.length - 1; x++)
      {
        if(points[x] != null)
        {
          batch.delete(linesRef.doc("$x")); // for some reason it does not do anything
        }
      }
      }
  }

  void _loadFromFirestone() async
  {
    if(currentRoom != 0)
    {
      //print("Error getting document");
      final db = FirebaseFirestore.instance;

      final CollectionReference<Map<String, dynamic>> courseList = FirebaseFirestore.instance.collection('/Rooms/room_$currentRoom/drawing_lines');

      AggregateQuerySnapshot query = await courseList.count().get();
        debugPrint('The number of courses: ${query.count}');

      int sizeFor = query.count;
      print("NUMBER OF DOCUMENTS: $sizeFor");

      for(int x = 0; x < sizeFor; x++)
      {
        final docRef = db.collection("/Rooms/room_$currentRoom/drawing_lines").doc("$x");
        docRef.get().then
        (
          (DocumentSnapshot doc)
          {
          
            points.add(DrawingBrushAdapted(doc.get("x") as double, doc.get("y") as double, doc.get("r") as int, doc.get("g") as int, doc.get("b") as int, doc.get("a") as int, doc.get("width") as int));
          },
          onError: (e) => print("Error getting document: $e"),
        );
      }
    }
  }
}

class CustomPainterWidged extends CustomPainter
{
  List<DrawingBrushAdapted?> pointsPass;

  CustomPainterWidged({required this.pointsPass});

  @override
  void paint(Canvas canvas, Size size)
  {
    Paint drawingCanvas = Paint();
    drawingCanvas.color = const Color.fromARGB(255, 255, 254, 223);

    Rect canvasRectangle = Rect.fromLTWH(0, 0, size.width, size.height);

    canvas.drawRect(canvasRectangle, drawingCanvas);

    // Teacher's method
    // int lastPos = 0;
    // int nullPos = pointsPass.indexOf(null, lastPos);
    // while (nullPos != -1) {
    //   final paint = pointsPass[lastPos]!.brushPaint;
    //   canvas.drawPoints(
    //     PointMode.lines,
    //     pointsPass.sublist(lastPos, nullPos).map((db) => db!.point).toList(),
    //     paint,
    //   );
    //   lastPos = nullPos + 1;
    //   nullPos = pointsPass.indexOf(null, lastPos);
    // }

    for (int x = 0; x < pointsPass.length - 1; x++)
    {
      if (pointsPass[x] != null && pointsPass[x + 1] != null)
      {
        Paint paint = Paint();
        paint.color = Color.fromARGB(pointsPass[x]!.color_R, pointsPass[x]!.color_G, pointsPass[x]!.color_B, pointsPass[x]!.color_A);
        paint.strokeWidth = 2.0;
        paint.strokeCap = StrokeCap.round;

        Offset offsetPoint1 = Offset(pointsPass[x]!.offsetPoint_X, pointsPass[x]!.offsetPoint_Y);
        Offset offsetPoint2 = Offset(pointsPass[x + 1]!.offsetPoint_X, pointsPass[x + 1]!.offsetPoint_Y);

        canvas.drawLine(offsetPoint1, offsetPoint2, paint);
      }
      else if (pointsPass[x] != null && pointsPass[x + 1] == null)
      {
        Paint paint = Paint();
        paint.color = Color.fromARGB(pointsPass[x]!.color_R, pointsPass[x]!.color_G, pointsPass[x]!.color_B, pointsPass[x]!.color_A);
        paint.strokeWidth = 2.0;
        paint.strokeCap = StrokeCap.round;

        Offset offsetPoint1 = Offset(pointsPass[x]!.offsetPoint_X, pointsPass[x]!.offsetPoint_Y);
        canvas.drawPoints(PointMode.points, [offsetPoint1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)
  {
    return true;
  }
}
