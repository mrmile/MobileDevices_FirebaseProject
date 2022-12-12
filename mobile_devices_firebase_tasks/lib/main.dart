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
  List<Offset> points = [];

  @override
  Widget build(BuildContext context)
  {
    final double referenceWidth = MediaQuery.of(context).size.width;
    final double referenceHeight = MediaQuery.of(context).size.height;

    return Scaffold
    (
      appBar: AppBar
      (
        title: Text(widget.title),
      ),
      body: Center
      (
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>
          [
            Container
            (
              width: referenceWidth * 0.80,
              height: referenceHeight * 0.80,
              color: Colors.white,

              child: GestureDetector
              (
                onPanDown: (details)
                {
                  setState //this.setState...
                  (() {
                    points.add(details.localPosition);
                  });
                },
                onPanUpdate: (details)
                {
                  setState
                  (() {
                    points.add(details.localPosition);
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
            )
          ],
        ),
      ),
    );
  }
}

class CustomPainterWidged extends CustomPainter
{
  List<Offset> pointsPass;

  CustomPainterWidged({required this.pointsPass});

  @override
  void paint(Canvas canvas, Size size)
  {
    Paint drawingCanvas = Paint();
    drawingCanvas.color = Colors.white;

    Rect canvasRectangle = Rect.fromLTWH(0, 0, size.width, size.height);

    canvas.drawRect(canvasRectangle, drawingCanvas);

    Paint paint = Paint();
    paint.color = Colors.black;
    paint.strokeWidth = 2.0;
    paint.strokeCap = StrokeCap.round;

    for(int x = 0; x < pointsPass.length - 1; x++)
    {
      if(pointsPass[x] != null && pointsPass[x + 1] != null)
      {
        canvas.drawLine(pointsPass[x], pointsPass[x + 1], paint);
      }
      else if(pointsPass[x] != null && pointsPass[x + 1] == null)
      {
        canvas.drawPoints(PointMode.points, [pointsPass[x]], paint);
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