
import 'package:flutter/painting.dart';
import 'package:peso_mate_getx/app/data/widgets/colors.dart';
import 'package:peso_mate_getx/app/data/widgets/text_widget.dart';


DateTime time= DateTime.now();


 greetings(){
  if(time.hour>=00&&time.hour<12){
    return   TextWidget(text:"Good morning",maxsize: 16,minsize: 12, color:amber,fontWeight: FontWeight.bold,);
  }else if(time.hour>=12&&time.hour<16){
   return   TextWidget(text:"Good afternoon",maxsize: 16,minsize: 12, color: amber,fontWeight: FontWeight.bold,);
  }else{
   return   TextWidget(text:"Good evening",maxsize: 16,minsize: 12, color: amber,fontWeight: FontWeight.bold);
  }

}