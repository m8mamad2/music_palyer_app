
import 'package:flutter/material.dart';
import 'package:myMoon/utils/sizes.dart';

Widget appBarIcons(BuildContext context,VoidCallback onPress,Icon icon,Color bgColor,)=> Container(
  width:kWidth(context)*0.1,
                    decoration:const BoxDecoration(
                      shape: BoxShape.circle,
                      color:Colors.black54,
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
                        
                      ]
                    ),
                    child: IconButton(
                      onPressed: onPress,
                      icon: icon,
                      color:Colors.white
                    ),
                  );
