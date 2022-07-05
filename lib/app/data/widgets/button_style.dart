import 'package:flutter/material.dart';
import 'package:peso_mate_getx/app/data/widgets/colors.dart';

ButtonStyle buttonStyle({Color color=red,double radius=10,pressed}) {

  return ButtonStyle(
    foregroundColor: MaterialStateProperty.all(Colors.white),

    backgroundColor: MaterialStateProperty.all(color),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),    
    ),
  );
}


