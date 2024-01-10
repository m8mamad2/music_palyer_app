import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:myMoon/audi_player.dart';
import 'package:myMoon/qr_screen.dart';
import 'package:myMoon/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  O3DController controller = O3DController();
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
              child: Container(
                decoration: const BoxDecoration(color: Color(0xff010101),),
                width: kWidth(context),
                height: kHeight(context),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/models/2k_stars.jpg',
                      width: sizeW(context),
                      height: sizeH(context),
                      fit: BoxFit.cover,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        
                        //! icon in top
                        Container(
                          margin: EdgeInsets.only(left: kWidth(context)*0.8),
                          child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Center(
                                  child: Container(
                                  //  decoration: BoxDecoration(
                                  //    color: Colors.white10,
                                  //    borderRadius: BorderRadius.circular(10),
                                  //    border: Border.all(color: Colors.white54)),
                                    height: kHeight(context)*0.064,
                                    width: kWidth(context)*0.12,
                                  ),
                                ),
                                SizedBox(height: kHeight(context)*0.1,child: Center(child: SizedBox())),
                              ],
                            ),
                        ),
      
                        
                        //! lottie
                        Container(
                          width: sizeW(context)*0.6,
                          height: sizeW(context)*0.6,
                          child: ModelViewer(
                            cameraControls: true,
                            alt: ' A 3d Model',
                            src: 'assets/models/1234.glb')
                          // O3D.asset( ModelViewer
                          //   controller: controller, 
                          //   src: 'assets/models/1234.glb'),
                        ),
                        Spacer(),

                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: sizeW(context)*0.15),
                          child: Column(
                            children: [
                              // const Text('   لورم ایپسوم\nسازنده متن ',
                              //   style: TextStyle(
                              //     color: Colors.white,
                              //     fontWeight: FontWeight.bold,
                              //     fontSize: 30,
                              //     fontFamily: 'first'
                              //   ),),
                                
                              // SizedBox(height: kHeight(context)*0.04,),
                            
                              // const Text('لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم ', style: TextStyle(color: Colors.white,fontFamily: 'thired',),),
                              // SizedBox(height: kHeight(context)*0.08,),
                            
                              InkWell(
                                onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => const QRCodeScreen(),)),
                                child: Container(
                                  width: kWidth(context)*0.45,
                                  height: kHeight(context)*0.07,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(2, 2),
                                        color: Colors.white38,
                                        blurRadius: 10
                                      ),
                                    ],
                                    color:Colors.white,
                                    border: Border.all(color: Colors.white,width: 0.3),
                                    borderRadius: BorderRadius.circular(25)
                                  ),
                                  child: Center(child: Text('برای اسکن اینجا رو بزن',style: TextStyle(color: const Color.fromARGB(255, 131, 121, 121),fontFamily: 'second',fontWeight: FontWeight.w100,fontSize: kWidth(context)*0.03),))),
                                ),
                            ],
                          ),
                        )
                        
                      ],
                    ),
                  ],
                ),
                // const Color(0xffdfd8cd)
              ),
            )
      
      ),
    );
      
  }
}

// body: Stack(
//           children: [
//             // Opacity(
//             //   opacity: 0.3,
//             //   child: Container(
//             //     margin: EdgeInsets.only(top: kHeight(context)*0.2),
//             //     child: kFlowerLottie),
//             // ),
//             Column(
//               children: [
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                      Padding(
//                       padding: EdgeInsets.symmetric(horizontal: kWidth(context)*0.08,vertical: kHeight(context)*0.03),
//                       child: Text('سلام 🌻 من',style: TextStyle(fontWeight: FontWeight.bold,fontSize: kWidth(context)*0.08,color: Colors.white),),
//                     ),
//                     // Text('data'),
//                     ElevatedButton(onPressed: (){                    
//                     }, child: const Text('اسکن کن'))
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),






//! iamge
// Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 3,vertical: 5),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               border: Border.all(color: Colors.black38,width: 1),
//                               boxShadow:const [
//                                 BoxShadow(
//                                   color: Colors.white12,
//                                   blurRadius: 25,
//                                   offset: Offset(0, 2))
//                               ]
//                             ),
//                             width: kWidth(context),
//                             height: kHeight(context) * 0.55,
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(10),
//                               child: Image.asset('assets/images/first.jpeg',fit: BoxFit.cover,)),
//                           ),
//                         ),