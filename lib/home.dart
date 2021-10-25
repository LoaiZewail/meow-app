import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:blur/blur.dart';

class ForcePicRefresh extends StatefulWidget {
  static final id = 'home';
  @override
  _ForcePicRefreshState createState() => _ForcePicRefreshState();
}

class _ForcePicRefreshState extends State<ForcePicRefresh> {
  String url = 'https://cataas.com/cat/gif';
  Widget? _pic;

  @override
  void initState() {
    _pic = Image.network(url);
    super.initState();
  }

  _updateImgWidget() async {
    setState(() {
      _pic = CircularProgressIndicator(
        color: Colors.amber,
      );
    });
    Uint8List bytes = (await NetworkAssetBundle(Uri.parse(url)).load(url))
        .buffer
        .asUint8List();
    setState(() {
      _pic = Image.memory(
        bytes,
        fit: BoxFit.fill,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Stack(children: [
          Blur(
            blur: 33,
            blurColor: Colors.amber,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image(
                image: NetworkImage(url),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: _pic,
            ),
          )
        ]),
        onTap: () {
          _updateImgWidget();
        },
      ),
    );
  }
}
