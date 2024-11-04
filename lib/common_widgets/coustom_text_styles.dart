import 'package:flutter/material.dart';
import 'package:kartheek/core/color_pallet.dart';

const bold="bold";
const regular="regular";

ourStyle({family="regular", double? size = 14, color= Pallete.gradient3}){
  return  TextStyle(
    fontSize:size,
    color: color,
    fontFamily: family
  );
}