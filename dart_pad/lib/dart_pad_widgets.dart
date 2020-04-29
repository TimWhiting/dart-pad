import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'src/theme.dart';
import 'src/common_widgets.dart';

class DartPadApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: DartPadTheme.dartPadTheme,
      home: DartPadWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DartPadWidget extends StatefulWidget {
  const DartPadWidget({
    Key key,
  }) : super(key: key);

  @override
  _DartPadWidgetState createState() => _DartPadWidgetState();
}

class _DartPadWidgetState extends State<DartPadWidget> {
  PopupMenuItem<String> _dropDown(String value, Widget icon) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: icon,
          ),
          Text(value),
        ],
      ),
    );
  }

  ScrollController _scrollController;
  FocusNode _focus = FocusNode(
      onKey: (node, key) =>
          key == RawKeyEvent.fromMessage({'keyCode': 9}) ? true : false);

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: DartIcon(),
            ),
            Text('DartPad',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.white)),
            SizedBox(width: 20),
            ButtonIconShowIfRoom(
              icon: Icons.code,
              text: 'New Pad',
              onPressed: () {},
            ),
            FlatButton.icon(
              icon: Icon(Icons.refresh),
              label: Text('Reset'),
              onPressed: () {},
            ),
            ButtonIconShowIfRoom(
              icon: Icons.format_align_left,
              text: 'Format',
              onPressed: () {},
            ),
            ButtonIconShowIfRoom(
              icon: Icons.get_app,
              text: 'Install SDK',
              onPressed: () {},
            ),
            Spacer(),
            Text('Title'),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: PopupMenuButton<String>(
                offset: Offset(0, 80),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Samples',
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.expand_more, color: Colors.white),
                  ],
                ),
                itemBuilder: (context) => [
                  _dropDown('Hello World', DartIcon()),
                  _dropDown('Int to Double', DartIcon()),
                  _dropDown('Mixins', DartIcon()),
                  _dropDown('Fibonacci', DartIcon()),
                  _dropDown('Counter', FlutterIcon()),
                  _dropDown('Sunflower', FlutterIcon()),
                  _dropDown('Draggables & physics', FlutterIcon()),
                  _dropDown('Implicit animations', FlutterIcon()),
                ],
                onSelected: (value) {},
              ),
            ),
            PopupMenuButton(
              offset: Offset(0, 80),
              child: Icon(Icons.more_vert, color: Colors.white),
              itemBuilder: (context) => [
                _dropDown('Share', Icon(Icons.launch)),
                _dropDown('DartPad on GitHub', Icon(Icons.launch)),
                _dropDown('dart.dev', Icon(Icons.launch)),
                _dropDown('flutter.dev', Icon(Icons.launch)),
              ],
              onSelected: (value) {},
            )
          ],
        ),
      ),
      body: Row(children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Scrollbar(
                  controller: _scrollController,
                  isAlwaysShown: true,
                  child: TextField(
                    focusNode: _focus,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    style: Theme.of(context).textTheme.headline6,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter some code here',
                    ),
                    scrollController: _scrollController,
                    maxLines: 5000,
                    minLines: 20,
                  ),
                ),
                Positioned.directional(
                  textDirection: TextDirection.ltr,
                  end: 10,
                  top: 0,
                  child: RaisedButton.icon(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    padding: EdgeInsets.only(
                        left: 20, top: 16, bottom: 16, right: 30),
                    icon: Icon(Icons.play_arrow),
                    label: Text('RUN'),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text: 'Console',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text: 'Documentation',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
      persistentFooterButtons: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              if (isDesktop(context))
                IconButton(icon: SvgPicture.asset('pictures/keyboard.svg')),
              FlatButton(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Privacy notice'),
                onPressed: () {},
              ),
              FlatButton(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Send Feedback'),
                onPressed: () {},
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('3 issues'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'hide',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: Colors.blue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Based on Dart SDK 2.7.2'),
              ),
            ],
          ),
        ),
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
