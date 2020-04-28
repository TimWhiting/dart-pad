import 'package:flutter/material.dart';
import 'src/theme.dart';

class DartPadApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: DartPadTheme.dartPadTheme,
      home: DartPadWidget(),
    );
  }
}

class DartPadWidget extends StatelessWidget {
  const DartPadWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Image.asset('pictures/logo_dart.png', width: 50, height: 50),
          Text('DartPad', style: Theme.of(context).textTheme.headline3),
          FlatButton(
            child: Row(
              children: [Icon(Icons.code), Text('New Pad')],
            ),
            onPressed: () {},
          ),
          FlatButton(
            child: Row(
              children: [Icon(Icons.refresh), Text('Reset')],
            ),
            onPressed: () {},
          ),
          FlatButton(
            child: Row(
              children: [Icon(Icons.text_format), Text('Format')],
            ),
            onPressed: () {},
          ),
          FlatButton(
            child: Row(
              children: [Icon(Icons.file_download), Text('Install SDK')],
            ),
            onPressed: () {},
          ),
        ]),
      ),
      persistentFooterButtons: [
        FlatButton(
          child: Text('Privacy notice'),
          onPressed: () {},
        )
      ],
    );
  }
}

/// An inline version of dart pad widget able to be embedded in any application
class DartPadEmbedInlineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

/// A dart pad widget able to be embedded in any application with dart support
class DartPadEmbedDartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

/// A dart pad widget able to be embedded in any application with html support only can be used on FLutter Web
class DartPadEmbedHtmlWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

/// A dart pad widget able to be embedded in any application with flutter support
class DartPadEmbedFlutterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
