
import 'package:flutter/material.dart';
import 'package:myMoon/splash_screen.dart';

Future main()async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MaterialApp(  debugShowCheckedModeBanner: false,  home: SplashScreen() ) );
}
  