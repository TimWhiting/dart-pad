import 'package:flutter/material.dart';

bool isDesktop(BuildContext context) {
  return MediaQuery.of(context).size.width > 850;
}

class DartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/pictures/logo_dart.png', width: 24, height: 24);
  }
}

class FlutterIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/pictures/logo_flutter.png',
        width: 24, height: 24);
  }
}
