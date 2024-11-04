import 'package:flutter/material.dart';


  Widget CoustomField({hint_text, controller, isObscuretext=false}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint_text
      ),
      validator: (val){
        if(val!.trim().isEmpty){
          return"$hint_text is missing!";
        }
        return null;
      },
      obscureText: isObscuretext,
      obscuringCharacter: "*",
    );
  }
