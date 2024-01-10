

import 'package:flutter/material.dart';
import 'package:myMoon/audi_player.dart';




class MMMM extends StatelessWidget {
  const MMMM({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
     mainAxisAlignment: MainAxisAlignment.center,
     crossAxisAlignment: CrossAxisAlignment.center,
     children: [
       Row(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           oneAngle2(context, 4),
           SizedBox(width: sizeW(context)*0.1,),
           oneAngle(context, 4),
         ],
       ),
       SizedBox(height: sizeH(context)*0.1,),
       Row(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           oneAngle(context, 2),
           SizedBox(width: sizeW(context)*0.1,),
           oneAngle2(context, 2),
         ],
       ),
       
     ],
      );
  }
  Widget oneAngle(BuildContext context,int rotate)=> RotatedBox(
    quarterTurns: rotate,
    child: Container(
      child: CustomPaint(
        size: Size(sizeW(context)*0.35,sizeW(context)*0.35), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
        painter: RPSCustomPainter(),),
    ),
  );
  
  Widget oneAngle2(BuildContext context,int rotate)=> RotatedBox(
    quarterTurns: rotate,
    child: Container(
      padding: EdgeInsets.only(bottom: sizeW(context)*0.01),
      child: CustomPaint(
        size: Size(sizeW(context)*0.35,sizeW(context)*0.35), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
        painter: RPSCustomPainter2(),),
    ),
  );
}


class RPSCustomPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  // Layer 1
  
  Paint paint_fill_0 = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    Path path_0 = Path();
    path_0.moveTo(size.width*0.62,size.height*0.71);
    path_0.lineTo(size.width*0.62,size.height*0.36);
    path_0.lineTo(size.width*0.41,size.height*0.35);

    canvas.drawPath(path_0, paint_fill_0);
  

  // Layer 1
  
  Paint paint_stroke_0 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.01
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    
    canvas.drawPath(path_0, paint_stroke_0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RPSCustomPainter2 extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  // Layer 1
  
  Paint paint_fill_0 = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    Path path_0 = Path();
    path_0.moveTo(size.width*0.62,size.height*0.35);
    path_0.lineTo(size.width*0.41,size.height*0.35);
    path_0.lineTo(size.width*0.41,size.height*0.71);

    canvas.drawPath(path_0, paint_fill_0);
  

  // Layer 1
  
  Paint paint_stroke_0 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.01
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    
    canvas.drawPath(path_0, paint_stroke_0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
