import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:kartheek/common_widgets/coustom_field.dart';
import 'package:kartheek/common_widgets/coustom_text_styles.dart';
import 'package:kartheek/core/color_pallet.dart';
import 'package:kartheek/login.dart';
import 'package:kartheek/signup.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _HomeState();
}


class _HomeState extends State<Profile> {

  Future<void> logout() async{
    try{
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch(e){
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Music',style: ourStyle(
          family: bold,
          size: 18,
        ),),
        backgroundColor: Pallete.gradient2,
        elevation: 4.0,
        actions: [
          IconButton(onPressed:() async{
            await logout().then((value){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
            });
          }, icon:Icon(Icons.logout))
        ],
      ),
      body: Container(),
    );
  }
}
