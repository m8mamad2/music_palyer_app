
// import 'package:myMoon/audi_player.dart';
// import 'package:myMoon/home_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:myMoon/utils/color.dart';
// import 'package:myMoon/utils/sizes.dart';
// import 'package:video_player/video_player.dart';


// class VideoPlayerScreen extends StatefulWidget {
//   const VideoPlayerScreen({super.key});

//   @override
//   State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
// }
// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  
  
//   late VideoPlayerController videoPlayerController;

//   @override
//   void initState() {
//     super.initState();
  
//     videoPlayerController = VideoPlayerController.asset('assets/second.mp4',)
//       ..initialize().then((value) => setState((){}));
    
//     videoPlayerController.addListener(() { 
//       setState((){});
//     });

//   }

//   @override
//   void dispose() {
//     videoPlayerController.dispose();
//     super.dispose();
//   }
  
  
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: kBackgroundColor,
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//                 padding: EdgeInsets.symmetric(horizontal: kWidth(context)*0.05,vertical: kHeight(context)*0.03),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     appBarButton(context,()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen(),)),Icons.arrow_back),
//                     appBarButton(context,(){},Icons.favorite),
//                   ],
//                 ),
//               ),
//             Container(
//               margin:EdgeInsets.only(top: sizeW(context)*0.08) ,
//               width: kWidth(context)*0.9,
//               height: kHeight(context)*0.5,
//               decoration:BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: const [
//                   BoxShadow(
//                     offset: Offset(4,10),
//                     color: Colors.black,
//                     blurRadius: 10
//                   ),
//                   BoxShadow(
//                     offset: Offset(0,1),
//                     color: Colors.white12,
//                     blurRadius: 10,
//                   ),
//                 ]
//               ),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: kBackgroundColor,
//                   borderRadius: BorderRadius.circular(10)),
//                 padding: const EdgeInsets.all(10),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: videoPlayerController.value.isInitialized 
//                     ? AspectRatio(
//                         aspectRatio:videoPlayerController.value.aspectRatio,
//                         child: VideoPlayer(videoPlayerController))
//                     : const SizedBox.shrink()
//                   ),
//               )
            
//               ),
//             const Spacer(),
//             SizedBox(
//               width: sizeW(context)*0.94,
//               child: Slider(
//                 min: 0.0,
//                 max: videoPlayerController.value.duration.inSeconds.toDouble(),
//                 value: videoPlayerController.value.position.inSeconds.toDouble(),
//                 activeColor: const Color(0xffdfd8cd),
//                 inactiveColor: Colors.black,
//                 onChanged: (double value) {
//                   setState(()=>
//                     videoPlayerController.seekTo(Duration(seconds: value.toInt())) );
//                 },
//               ),
//             ),
//             Padding(
//             padding: EdgeInsets.symmetric(horizontal: kWidth(context)*0.09),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(videoPlayerController.value.position.toString().substring(2,7),style: const TextStyle(color: Colors.white),),
//                   Text(videoPlayerController.value.duration.toString().substring(2,7),style: const TextStyle(color: Colors.white),),
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 actionButton(context,Icons.skip_previous_outlined,()async{
//                   if(videoPlayerController.value.position.inSeconds > 1) videoPlayerController.seekTo(Duration( seconds: videoPlayerController.value.position.inSeconds - 10)); }),
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 5,horizontal: kWidth(context)*0.05),
//                   child: CircleAvatar(
//                     backgroundColor: const Color(0xffdfd8cd),
//                     radius: kWidth(context)*0.11,
//                     child: Center(
//                       child: IconButton(
//                         icon: Icon(videoPlayerController.value.isPlaying ? Icons.pause : Icons.play_arrow,color: kBackgroundColor,),
//                         onPressed: () => setState((){
//                           videoPlayerController.value.isPlaying 
//                             ? videoPlayerController.pause()
//                             : videoPlayerController.play();
//                         }),
//                       ),
//                     ),
//                   ),
//                 ),
//                 actionButton(context,Icons.skip_next_outlined,()async=>
//                   videoPlayerController.seekTo(Duration( seconds: videoPlayerController.value.position.inSeconds + 1)) ),
//               ],
//             ),
//             SizedBox(height: kHeight(context)*0.05,),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Container actionButton(BuildContext context,IconData icon,VoidCallback onPress) {
//     return Container(
//     width: kWidth(context)*0.15,
//     height: kHeight(context)*0.065,
//     decoration:const BoxDecoration(
//       shape: BoxShape.circle,
//       color: kBackgroundColor,
//       boxShadow: [
//       BoxShadow(
//         offset: Offset(4,10),
//         color: Colors.black,
//         blurRadius: 8
//       ),
//       BoxShadow(
//         offset: Offset(-2,-2),
//         color: Colors.white12,
//         blurRadius: 10,
//       ),
//       ]
//     ) ,
//     child: IconButton(
//       onPressed:onPress,
//       icon: Icon(icon,color: Colors.white,)));
//   }
  