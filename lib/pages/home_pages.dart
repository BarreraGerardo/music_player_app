import 'package:flutter/material.dart';
import 'package:music_player_app/components/my_drawer.dart';

class HomePages extends StatefulWidget{
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePageState();
  }

class _HomePageState extends State<HomePages>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
     backgroundColor: Theme.of(context).colorScheme.surface,
     appBar: AppBar(title: const Text("P L A Y L I S T")),
     drawer: const MyDrawer(),
    );
    
  }
  }
