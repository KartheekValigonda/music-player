import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kartheek/common_widgets/coustom_text_styles.dart';
import 'package:kartheek/controllers/player_controller.dart';
import 'package:kartheek/core/color_pallet.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlayerController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search, color: Colors.white))
        ],
        leading: const Icon(Icons.sort_rounded, color: Colors.white ,),
        title: Text("Beats", style: ourStyle(
          family: bold,
          size: 20,
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
            itemCount:100,
            itemBuilder: (BuildContext context, int index){
          return Container(
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.only(bottom:4,),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                title: Text("Music Name", style: ourStyle(
                  family: bold,
                  size: 15,),),
                subtitle:Text("Artist Name", style: ourStyle(
                  family: regular,
                  size: 12,),),
                leading: const Icon(Icons.music_note, color: Colors.white, size: 32,),
                trailing: const Icon(Icons.play_arrow, color: Colors.white, size: 26,),
              )
          );
            }),
      )
    );
  }
}
