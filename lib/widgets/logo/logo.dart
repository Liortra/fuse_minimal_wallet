import 'package:flutter/material.dart';

class Logo extends StatefulWidget {
  final String path;

  const Logo({Key? key, required this.path}) : super(key: key);

  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(widget.path),
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter),
        ),
      ),
    );
  }
}
