import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kartheek/common_widgets/coustom_field.dart';
import 'package:kartheek/core/color_pallet.dart';
import 'package:kartheek/core/home.dart';
import 'package:kartheek/profile.dart';
import 'package:kartheek/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey= GlobalKey<FormState>();

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
    formKey.currentState!.validate();
  }

  Future<UserCredential?> loginUserWithEmailAndPassword({email,password}) async{
    UserCredential? userCredential;
    try{
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password);
    } on FirebaseAuthException catch(e){
      print(e.message);
    }
    return userCredential;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body:Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 100,),
                const Text("Login", style: TextStyle(
                  fontSize: 50,
                  fontWeight:FontWeight.bold,
                ),),
                const SizedBox(height: 40),
                CoustomField(hint_text:"Username", controller: emailController),
                const SizedBox(height: 15),
                CoustomField(hint_text:"Password", controller: passwordController, isObscuretext: true),
                const SizedBox(height: 25,),
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [Pallete.gradient1,Pallete.gradient2]),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: ElevatedButton(onPressed: () async{
                    await loginUserWithEmailAndPassword(
                        email:emailController.text.toString(),
                        password:passwordController.text.toString()).then((value){
                          if(value!=null){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
                          }
                    });
                  },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(390, 50),
                        backgroundColor: Pallete.transparentColor,
                        shadowColor: Pallete.transparentColor
                      ),
                      child: const Text("Log in",style:TextStyle(fontSize: 20),)),
                ),
                const SizedBox(height:10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>const Signup()));
                    }, child: const Text("Sign Up", style: TextStyle(color:Pallete.gradient1),))
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
