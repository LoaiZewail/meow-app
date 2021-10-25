import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);
  static final id = 'landing';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(ForcePicRefresh.id);
        },
        child: Stack(children: [
          Blur(
            blur: 33,
            blurColor: Colors.amber,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image(
                image: NetworkImage('https://cataas.com/cat/gif'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250),
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/1.png'),
                  Text(
                    'Meow',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 44, fontFamily: 'Boogaloo'),
                  ),
                  Text(
                    'Tap to see cool cats !',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontFamily: 'Boogaloo'),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
