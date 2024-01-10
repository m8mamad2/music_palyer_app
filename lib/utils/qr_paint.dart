import 'package:flutter/material.dart';

Widget onePaintTreeDots() => CustomPaint(
  size: const Size(100,100), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
  painter: RPSCustomPainter(),
);


class RPSCustomPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  // Layer 1
  
  Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(0, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.01
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    Path path_0 = Path();
    path_0.moveTo(size.width*0.0142500,size.height*-0.0113000);
    path_0.lineTo(size.width*0.0142500,size.height*0.9937000);
    path_0.lineTo(size.width*1.0142500,size.height*0.9787000);

    canvas.drawPath(path_0, paint_fill_0);
  

  // Layer 1
  
  Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.04
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
     
         
    
    canvas.drawPath(path_0, paint_stroke_0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}

Widget CameraBorder()=>Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                RotatedBox(
                  quarterTurns:1 ,
                  child: Center(child: onePaintTreeDots(),)),
                const SizedBox(width: 70,),
                RotatedBox(
                  quarterTurns: 2,
                  child: Center(child: onePaintTreeDots(),))
              ],
            ),
            const SizedBox(height: 100,),
            RotatedBox(
              quarterTurns: 4,
              child: Row(
                children: [
                  Center(child: onePaintTreeDots(),),
                  const SizedBox(width: 70,),
                  RotatedBox(
                    quarterTurns: 3,
                    child: Center(child: onePaintTreeDots(),))
                ],
              ),
            ),
        ],);