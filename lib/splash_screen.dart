import 'dart:async';

import 'package:myMoon/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:myMoon/utils/extenstion.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Timer(const Duration(milliseconds: 10000), () => context.navigate(context,const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000d0e),
      body: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0.0,end: 1.0),
            curve: Curves.ease,
            duration: const Duration(seconds: 11),
            builder: (context, value, child) => Opacity(
              opacity: value,
              child: Center(child: Image.asset('assets/Logo.png',fit: BoxFit.cover,)),
        ),),
    );
  }
}

