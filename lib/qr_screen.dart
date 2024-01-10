//! flutter barcode scanner
import 'dart:io';

import 'package:myMoon/audi_player.dart';
import 'package:myMoon/repo/repo.dart';
import 'package:myMoon/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'widget/apppbar_icon.dart';
import 'package:myMoon/widget/angles.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({super.key});

  @override
  State<QRCodeScreen> createState() => _QRCodeScreenState();
}
class _QRCodeScreenState extends State<QRCodeScreen> {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
            children: [
              Positioned.fill(
                child: QRView(
                  key: qrKey, 
                  onQRViewCreated: _onQRViewCreated)),
              
              // Padding(
              //   padding: EdgeInsets.symmetric(vertical: kHeight(context)*0.03),
              //   child: Align(
              //     alignment: FractionalOffset.bottomCenter,
              //     child: Container(
              //       height: kHeight(context)*0.12,
              //       width: kWidth(context)*0.9,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //         color: Colors.black54,
              //       ),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         children: [
              //           // const Text('رو الان اسکن کنQR Code عزیزم اون ',style: TextStyle(color: Colors.white,fontFamily: 'first',),),
              //           const Text('لورم ایپسوم متن ساختگی با تولید سادگی',style: TextStyle(color: Colors.white,fontFamily: 'first',),),
              //           Container(
              //             width: sizeW(context)*0.2,
              //             height: sizeH(context)*0.1,
              //             decoration: BoxDecoration(
              //               color: Colors.black87,
              //               borderRadius: BorderRadius.circular(22)
              //             ),
              //             child: Lottie.asset('assets/lottie/moon_icon.json'),
              //           ),
              //         ],
              //       ),
              //     )),
              // ),
             
              Center(
                child: Container(
                  margin: EdgeInsets.only(left: sizeW(context)*0.1,bottom: sizeW(context)*0.3),
                  child: MMMM()),
              ),
              Container(
                margin: EdgeInsets.only(top: kHeight(context)*0.02),
                padding: EdgeInsets.symmetric(horizontal: kWidth(context)*0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    appBarIcons(context,
                      ()=> Navigator.of(context).pop(), 
                      const Icon(Icons.arrow_back),Colors.white),
                    // appBarIcons(context, () async =>await controller!.flipCamera(), const Icon(Icons.cameraswitch_rounded),Colors.white),
                  ],
                ),
              ),
              
            ],
          ),
      ),
    );
  }


  _onQRViewCreated(QRViewController controller){
      controller.scannedDataStream.listen((scanData)async {


        String url =await AA().read(scanData.code!);
      //   print(url);
        
      //   // String data =await downloadVoice(url, 'mp3').then((value) {log('in AFTER') ;return value!;});
      //   // ignore: use_build_context_synchronously
        if(url == 'voice5.mp3') {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => VoicePlayerScreen(path: url),));
          controller.pauseCamera();
        }
      });
    }
  
  @override
  void reassemble(){
    super.reassemble();
    if(Platform.isAndroid)controller!.pauseCamera();
  }



  //? download file
  // Future<String?> downloadVoice(data, String fileType) async {
//       final String path = (await getApplicationDocumentsDirectory()).path;
//       print('path $path');
//       final file = File('$path/${math.Random().nextInt(10)}.$fileType');
//       print('File $file');
//       final response = await http.get(Uri.parse(data));
//       if(response.statusCode == 200){
//         print('is 200');
//         //! write to file
//         await file.writeAsBytes(response.bodyBytes);
//         //! return String that save in local 
//         print('final ${file.path}');
//         return file.path;
//       }
//       else { print('--------Error ${response.statusCode}');return null;}
//     }

  //? local
  // _onQRViewCreated(QRViewController controller){
  //   this.controller = controller;
  //   controller.scannedDataStream.listen((scanData) {
  //     log(scanData.code!);
  //     // Navigator.of(context).push(MaterialPageRoute(builder: (context) => VoicePlayerScreen(path:scanData.code!),));
  //     context.navigate(context, VoicePlayerScreen(path: scanData.code!));
  //   });
  // }

}






