import 'package:flutter/material.dart';
import './screen/meals.dart';
void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title:'meals',
    home:meals(),
  ));
}