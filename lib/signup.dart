import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kartheek/common_widgets/coustom_field.dart';
import 'package:kartheek/core/color_pallet.dart';
import 'package:kartheek/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey= GlobalKey<FormState>();

  @override
  void dispose(){
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
    formKey.currentState!.validate();
  }

  Future<UserCredential?> createUserWithEmailAndPassword({name, email, password}) async{
    UserCredential? userCredential;
    try{
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password);
      await storeUserData(name: name, email: email, password: password);
      return userCredential;
    }
    on FirebaseAuthException catch(e){
      print(e.message);
    }
    return userCredential;

  }

  Future<void> storeUserData({name, email, password}) async{
    DocumentReference store = FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid);
    await store.set({
      'name': name,
      'email': email,
      'password': password,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(),
        body:Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Form(
              key:formKey,
              child: Column(
                children: [
                  const SizedBox(height: 100,),
                  const Text("Sign Up", style: TextStyle(
                    fontSize: 50,
                    fontWeight:FontWeight.bold,
                  ),),
                  const SizedBox(height: 40),
                  CoustomField(hint_text:"Name", controller: nameController),
                  const SizedBox(height: 15),
                  CoustomField(hint_text:"Email", controller: emailController),
                  const SizedBox(height: 15,),
                  CoustomField(hint_text:"Password", controller: passwordController, isObscuretext: true),
                  const SizedBox(height: 25,),
                  Container(
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [Pallete.gradient1,Pallete.gradient2]),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: ElevatedButton(onPressed: () async {
                      await createUserWithEmailAndPassword(email:emailController.text.toString(),name: nameController.text.toString(),password: passwordController.text.toString() ).then((onValue){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Login()));;
                      });
                    },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(390, 50),
                            backgroundColor: Pallete.transparentColor,
                            shadowColor: Pallete.transparentColor
                        ),
                        child: const Text("Sign Up",style:TextStyle(fontSize: 20),)),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
