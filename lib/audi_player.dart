


import 'dart:async';
import 'dart:developer';

import 'package:myMoon/home_screen.dart';
import 'package:myMoon/utils/color.dart';
import 'package:myMoon/utils/lottie.dart';
import 'package:myMoon/utils/sizes.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';



class VoicePlayerScreen extends StatefulWidget {
  final String path;
  const VoicePlayerScreen({
    required this.path,
    Key? key,
  }) : super(key: key);

  @override
  State<VoicePlayerScreen> createState() => _VoicePlayerScreenState();
}
class _VoicePlayerScreenState extends State<VoicePlayerScreen> {
  
  late IconData icon;
  // bool isEnd = false;

  Future _initPlayer()async{

    audioPlayer.onDurationChanged.listen((event) {
      setState(() { duration = event; });
    });

    audioPlayer.onPositionChanged.listen((event) {
      setState((){ position = event; });
    });

    audioPlayer.onPlayerComplete.listen((event) { 

      setState(()  {
        position = duration;
        icon = Icons.replay;
        isPlaying = false;
        log('isPlaying --> $isPlaying');
        });
    });
    icon = Icons.play_arrow;
  }
  

  void playPause()async{
    if(isPlaying){
     await audioPlayer.pause();
     icon = Icons.play_arrow;
     isPlaying = false;
    }
    else{
      // Source urlSource = UrlSource(widget.path);
      // Source urlSource = DeviceFileSource(widget.path.substring(1));
      Source urlSource = AssetSource(widget.path);
      
      icon = Icons.pause;

      await audioPlayer.play(urlSource);
      isPlaying = true;
    }
    
    setState((){});
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    audioPlayer = AudioPlayer();
    _initPlayer();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  bool isPlaying = false;
  Duration duration = const Duration();
  Duration position = const Duration();
  late AudioPlayer audioPlayer;
  


  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //! app bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kWidth(context)*0.05,vertical: kHeight(context)*0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appBarButton(context,()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen(),)),Icons.arrow_back),
                  appBarButton(context,(){},Icons.favorite),
                ],
              ),
            ),
            
            //! image
            Container(
              margin: EdgeInsets.only(top: kHeight(context)*0.08),
              width: kWidth(context)*0.7,
              height: kHeight(context)*0.31,
              decoration:const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(4,10),
                    color: Colors.black,
                    blurRadius: 10
                  ),
                  BoxShadow(
                    offset: Offset(-3,-3),
                    color: Colors.white12,
                    blurRadius: 10,
                  ),
                ]
              ),
              child: CircleAvatar(
                backgroundColor: kBackgroundColor,
                child: CircleAvatar(
                  backgroundColor: kBackgroundColor,
                  // backgroundImage: const AssetImage('assets/images/first.jpeg',),
                  backgroundImage: const AssetImage('assets/image11.jpg',),
                  radius: kWidth(context)*0.285,
                ),
              ),
            ),
            SizedBox(height: kHeight(context)*0.05,),
            
            //! titles
            // Text('My Selenophile',style: TextStyle(color: Colors.white,fontFamily: 'first',fontSize: kWidth(context)*0.06),),
            // Text('You are the moon itself',style: TextStyle(color: Colors.grey,fontFamily: 'second',fontSize: sizeW(context)*0.029)),
            Text('راز شب',style: TextStyle(color: Colors.white,fontFamily: 'first',fontSize: kWidth(context)*0.06),),
            Text('حامیم',style: TextStyle(color: Colors.grey,fontFamily: 'second',fontSize: sizeW(context)*0.029)),
            SizedBox(height: kHeight(context)*0.07,),
            
            //! slider
            SizedBox(
              width: sizeW(context) * 0.9,
              child:Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(), 
                activeColor: const Color(0xffdfd8cd),
                inactiveColor: Colors.black,
                onChanged: (value) async {
                  await audioPlayer.seek(Duration(seconds: value.toInt()));
                  setState(() {});
                },),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kWidth(context)*0.11),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(duration.toString().substring(2,7),style: const TextStyle(color: Colors.white),),
                  Text(position.toString().substring(2,7),style: const TextStyle(color: Colors.white),),
                ],
              ),
            ),
            SizedBox(height: kHeight(context)*0.04,),
            
            //! button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // actionButton(context,Icons.skip_previous_outlined,'الهی قربون چشاش برم'),
                actionButton(context,Icons.skip_previous_outlined,'لورم ایسپوم'),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5,horizontal: kWidth(context)*0.05),
                  child: CircleAvatar(
                    backgroundColor: const Color(0xffdfd8cd),
                    radius: kWidth(context)*0.11,
                    child: Center(
                      child: IconButton(
                        icon: Icon(icon,size: kWidth(context)*0.08,color: kBackgroundColor,),
                        onPressed: playPause,
                      ),
                    ),
                  ),
                ),
                actionButton(context,Icons.skip_next_outlined,'لورم ایسپم'),
              ],
            )
          
          ],
        )
      ),
    );
  }



}
  showingDialogForNextAndPrevious(BuildContext context,String nextOrPrevious) async => await showDialog(
        context: context, 
        builder:(context) => AlertDialog(
          backgroundColor: kBackgroundColor,
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)),
          content: SizedBox(
            height: sizeH(context)*0.41,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: sizeH(context)*0.02),
                  child:Column(
                    children: [
                      // const Text('خیلی دوست دارم عاطفه من',style: TextStyle(color: Colors.white,fontFamily: 'first'),),
                      const Text('لورم ایپسوم متن ساختگی با',style: TextStyle(color: Colors.white,fontFamily: 'first'),),
                      Text(nextOrPrevious,style: TextStyle(color: Colors.white,fontFamily: 'first',fontWeight: FontWeight.w500,fontSize: sizeW(context)*0.03),),
                    ],
                  ),
                ),
                SizedBox(
                  width: sizeW(context)*0.4,
                  child: kSibilooLottier),
                Padding(
                  padding:  EdgeInsets.only(top: sizeH(context)*0.06),
                  child: ElevatedButton(
                    onPressed: ()=>Navigator.of(context).pop(), 
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(sizeW(context)*0.1,sizeH(context)*0.055),
                      backgroundColor: Colors.white,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                    ),
                    child: const Text('لورم ایسپوم',style: TextStyle(color: Colors.black,fontFamily: 'first'),)),
                    // child: const Text('میدونی که عزیزم؟',style: TextStyle(color: Colors.black,fontFamily: 'first'),)),
                )
                ],
            ),
          ),
    ),);


double sizeH(BuildContext context) => MediaQuery.of(context).size.height;
double sizeW(BuildContext context) => MediaQuery.of(context).size.width;



  //

  Container actionButton(BuildContext context,IconData icon,String nextOrPrevious) {
    return Container(
    width: kWidth(context)*0.15,
    height: kHeight(context)*0.065,
    decoration:const BoxDecoration(
      shape: BoxShape.circle,
      color: kBackgroundColor,
      boxShadow: [
      BoxShadow(
        offset: Offset(4,10),
        color: Colors.black,
        blurRadius: 8
      ),
      BoxShadow(
        offset: Offset(-2,-2),
        color: Colors.white12,
        blurRadius: 10,
      ),
      ]
    ) ,
    child: IconButton(
      // onPressed:()=> showingDialogForNextAndPrevious(context,nextOrPrevious),
      onPressed:(){},
      icon: Icon(icon,color: Colors.white,)));
  }

  

  Container appBarButton(BuildContext context,VoidCallback onPress,IconData icon) {
    return Container(
      decoration:const BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(2, 5),
            color: Colors.black,
            blurRadius: 10
          ),
          BoxShadow(
            offset: Offset(-2, -2),
            color: Colors.white12,
            blurRadius: 10,
          ),
        ],
        shape: BoxShape.circle,
        color: kBackgroundColor
      ),
      child: IconButton(onPressed: onPress, icon: Icon(icon,color: Colors.white,)));
  }