import 'package:flutter/material.dart';

bool isDesktop(BuildContext context) {
  return MediaQuery.of(context).size.width > 850;
}

class DartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('pictures/logo_dart.png', width: 24, height: 24);
  }
}

class FlutterIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('pictures/logo_flutter.png', width: 24, height: 24);
  }
}

class ButtonIconShowIfRoom extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String text;
  ButtonIconShowIfRoom({this.icon, this.text, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return isDesktop(context)
        ? FlatButton.icon(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
            ),
            icon: Icon(icon),
            label: Text(text),
            onPressed: onPressed,
          )
        : Container();
  }
}
