

import 'package:flutter/material.dart';

TextStyle myText11(
{
  FontWeight fontWeight = FontWeight.normal,
  Color textColor = Colors.red
}
){
  return TextStyle(
   fontWeight: fontWeight,
    fontSize: 11,
    color: textColor,

  );}
TextStyle myText21(){
  return const TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.normal,
  );
}
TextStyle myText31(){
  return const TextStyle(
    fontSize: 31,
    fontWeight: FontWeight.normal
  );
}
