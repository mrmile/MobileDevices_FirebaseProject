//import 'dart:ffi'; //Gives some errors - because of repeated declarations?
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_devices_firebase_tasks/firebase_options.dart';

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

class _MyHomePageState extends State<MyHomePage>
{
  List<DrawingBrushAdapted?> points = [];

  Color selectedColor = Colors.red;
  int currentColor_R = 255;
  int currentColor_G = 244;
  int currentColor_B = 67;
  int currentColor_A = 54;
  int defaultLineWidth = 5;

  int currentSelectedColor = 1;
  //DrawingBrush currentBrush = DrawingBrush({0,0}, Paint() ..color = Colors.black ..strokeCap = StrokeCap.round ..strokeWidth = 2.0);
  //@override
  //void initState()
  //{
  //  super.initState();
  //  Color selectedColor = Colors.black;
  //}

  @override
  Widget build(BuildContext context)
  {
    final double referenceWidth = MediaQuery.of(context).size.width;
    final double referenceHeight = MediaQuery.of(context).size.height;

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
                    points.add(DrawingBrushAdapted(details.localPosition.dx, details.localPosition.dy, currentColor_R, currentColor_G, currentColor_B, currentColor_A, defaultLineWidth));
                  });
                },
                onPanUpdate: (details)
                {
                  setState //this.setState...
                  (() {
                    //points.add(DrawingBrush(details.localPosition, Paint() ..color = selectedColor ..strokeCap = StrokeCap.round ..strokeWidth = 2.0));
                    points.add(DrawingBrushAdapted(details.localPosition.dx, details.localPosition.dy, currentColor_R, currentColor_G, currentColor_B, currentColor_A, defaultLineWidth));
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
                                selectedColor = Color.fromARGB(255, 244, 67, 54);
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
                                selectedColor = Color.fromARGB(255, 33, 150, 243);
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
                                selectedColor = Color.fromARGB(255, 255, 152, 0);
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
                                selectedColor = Color.fromARGB(255, 76, 175, 80);
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
                                selectedColor = Color.fromARGB(255, 255, 235, 59);
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
                                selectedColor = Color.fromARGB(255, 0, 0, 0);
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
                                selectedColor = Color.fromARGB(255, 255, 255, 255);
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
                              backgroundColor: Colors.white,
                              child:
                                  const Icon(Icons.delete, color: Colors.grey),
                              onPressed: ()
                              {
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
                              backgroundColor: Colors.white,
                              child: const Icon(Icons.chat_bubble,
                                  color: Colors.blue),
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
    //final db = FirebaseFirestore.instance;
    //final batch = db.batch();
    //final linesRef = db.collection("/Rooms/amtAzUi4eOJxcTiE5IHt/drawing_lines");
    //// Per tots els punts
    //batch.set(linesRef.doc(), { "a": currentSelectedColor });
    //batch.set(linesRef.doc(), { "a": 1 });
    //batch.set(linesRef.doc(), { "a": 1 });
    //await batch.commit();
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
      Paint paint = Paint();
      paint.color = Color.fromARGB(pointsPass[x]!.color_R, pointsPass[x]!.color_G, pointsPass[x]!.color_B, pointsPass[x]!.color_A);
      paint.strokeWidth = 2.0;
      paint.strokeCap = StrokeCap.round;

      if (pointsPass[x] != null && pointsPass[x + 1] != null)
      {
        Offset offsetPoint1 = Offset(pointsPass[x]!.offsetPoint_X, pointsPass[x]!.offsetPoint_Y);
        Offset offsetPoint2 = Offset(pointsPass[x + 1]!.offsetPoint_X, pointsPass[x + 1]!.offsetPoint_Y);

        //Paint paint = pointsPass[x]!.brushPaint;
        canvas.drawLine(offsetPoint1, offsetPoint2, paint);
      }
      else if (pointsPass[x] != null && pointsPass[x + 1] == null)
      {
        Offset offsetPoint1 = Offset(pointsPass[x]!.offsetPoint_X, pointsPass[x]!.offsetPoint_Y);
        Offset offsetPoint2 = Offset(pointsPass[x + 1]!.offsetPoint_X, pointsPass[x + 1]!.offsetPoint_Y);

        //Paint paint = pointsPass[x]!.brushPaint;
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
