import 'package:finalproject/main.dart';
import 'package:flutter/material.dart';

class mainMenu extends StatelessWidget {
  const mainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Image.asset("assets/logo.png"),
          ),
          SizedBox(height: 70,),
          TextButton(onPressed: (){
            Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HiLowGame()));
          }, child: Text("Start Game", style: TextStyle(fontSize: 40, color: Colors.yellow, fontWeight: FontWeight.bold),)),
        ],
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/bg.jpg"),
          fit: BoxFit.cover
        )
      ),
    );
  }
}