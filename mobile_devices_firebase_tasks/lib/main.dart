//import 'dart:ffi'; //Gives some errors - because of repeated declarations?
import 'dart:ui';
import 'package:flutter/material.dart';

void main()
{
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
  Offset point = const Offset(0,0);
  Paint brushPaint = Paint();

  DrawingBrush(this.point, this.brushPaint);
}

class _MyHomePageState extends State<MyHomePage>
{
  List<DrawingBrush> points = [];
  Color selectedColor = Colors.red;
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
                    points.add(DrawingBrush(details.localPosition, Paint() ..color = selectedColor ..strokeCap = StrokeCap.round ..strokeWidth = 2.0));
                  });
                },
                onPanUpdate: (details)
                {
                  setState
                  (() {
                    points.add(DrawingBrush(details.localPosition, Paint() ..color = selectedColor ..strokeCap = StrokeCap.round ..strokeWidth = 2.0));
                  });
                },
                onPanEnd: (details)
                {
                  setState
                  (() {
                    points.add(null!);
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
                              selectedColor = Colors.red;
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
                                if(currentSelectedColor == 1)
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
                              selectedColor = Colors.blue;
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
                                if(currentSelectedColor == 2)
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
                          backgroundColor: Colors.orange,
                          onPressed: ()
                          {
                            currentSelectedColor = 3;
                            setState //this.setState...
                            (() {
                              selectedColor = Colors.orange;
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
                                if(currentSelectedColor == 3)
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
                          backgroundColor: Colors.green,
                          onPressed: ()
                          {
                            currentSelectedColor = 4;
                            setState //this.setState...
                            (() {
                              selectedColor = Colors.green;
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
                                if(currentSelectedColor == 4)
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
                          backgroundColor: Colors.yellow,
                          onPressed: ()
                          {
                            currentSelectedColor = 5;
                            setState //this.setState...
                            (() {
                              selectedColor = Colors.yellow;
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
                                if(currentSelectedColor == 5)
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
                          backgroundColor: Colors.black,
                          onPressed: ()
                          {
                            currentSelectedColor = 6;
                            setState //this.setState...
                            (() {
                              selectedColor = Colors.black;
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
                                if(currentSelectedColor == 6)
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
                              selectedColor = Colors.white;
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
                                if(currentSelectedColor == 7)
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
                          child: const Icon(Icons.delete, color: Colors.grey),
                          onPressed: ()
                          {
                            points.clear();
                          }
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
                          child: const Icon(Icons.chat_bubble, color: Colors.blue),
                          onPressed: ()
                          {
                            // Will take you to the chat screen
                          }
                        ),
                      ),
                    ),
                  ]
                ),
                const SizedBox(width: 25),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomPainterWidged extends CustomPainter
{
  List<DrawingBrush> pointsPass;

  CustomPainterWidged({required this.pointsPass});

  @override
  void paint(Canvas canvas, Size size)
  {
    Paint drawingCanvas = Paint();
    drawingCanvas.color = const Color.fromARGB(255, 255, 254, 223);

    Rect canvasRectangle = Rect.fromLTWH(0, 0, size.width, size.height);

    canvas.drawRect(canvasRectangle, drawingCanvas);

    //Paint paint = Paint();
    //paint.color = Colors.black;
    //paint.strokeWidth = 2.0;
    //paint.strokeCap = StrokeCap.round;

    for(int x = 0; x < pointsPass.length - 1; x++)
    {
      if(pointsPass[x] != null && pointsPass[x + 1] != null)
      {
        Paint paint = pointsPass[x].brushPaint;
        canvas.drawLine(pointsPass[x].point, pointsPass[x + 1].point, paint);
      }
      else if(pointsPass[x] != null && pointsPass[x + 1] == null)
      {
        Paint paint = pointsPass[x].brushPaint;
        canvas.drawPoints(PointMode.points, [pointsPass[x].point], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)
  {
    // TODO: implement shouldRepaint
    return true;
  }
  
}