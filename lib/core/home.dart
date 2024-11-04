import 'package:flutter/material.dart';
import 'package:kartheek/common_widgets/coustom_text_styles.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            itemCount:100,
            itemBuilder: (BuildContext context, int index){
          return ;
            }),
      )
    );
  }
}
