import 'package:flutter/material.dart';

import 'detailpage.dart';

class newpage extends StatefulWidget {
  const newpage({Key? key}) : super(key: key);

  @override
  State<newpage> createState() => _newpageState();
}

class _newpageState extends State<newpage> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    super.initState();
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Center(
            child: SizedBox(
              height: 200,
              width: 250,
              child: RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                child: Image.asset(Variable.planets[index]['img']),
              ),
            ),
          ),
          Text(
            "${Variable.planets[index]['name']}",
            style: TextStyle(fontSize: 38, fontWeight: FontWeight.w500),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${Variable.planets[index]['des']}",style: TextStyle( fontSize: 20),
            ),
          ),
        ],
      ),
      //
    );
  }
}
