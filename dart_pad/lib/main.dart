import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:code_text_field/code_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'src/theme.dart';
import 'src/common_widgets.dart';
import 'package:highlight/languages/dart.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';

void main() {
  runApp(DartPadApp());
}

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
  PopupMenuItem<String> _dropDownItem(String value, Widget icon) {
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

  CodeController _codeController;

  @override
  void initState() {
    _codeController = CodeController(
      text: r"""
import '';
void main() {
  for (int i = 0; i < 5; i++) {
    print('hello ${i + 1}');
  }
}
class Yellow {
  void f() {

  }
}
""",
      language: dart,
      theme: codeTheme,
    );
    // _focus = FocusNode(onKey: (node, key) {
    //   print('focus');
    //   if (key.logicalKey == LogicalKeyboardKey.tab) {
    //     print('here');
    //     _codeController.value = _codeController.value.copyWith(
    //         text: _codeController.value.text
    //                 .substring(0, _codeController.value.selection.baseOffset) +
    //             '\t' +
    //             _codeController.value.text
    //                 .substring(_codeController.value.selection.baseOffset),
    //         selection: _codeController.value.selection.copyWith(
    //           baseOffset: _codeController.value.selection.baseOffset + 1,
    //           extentOffset: _codeController.value.selection.extentOffset + 1,
    //         ));
    //     return true;
    //   }
    //   print('there');
    //   return false;
    // });
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
            Text(
              'DartPad',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.white),
            ),
            SizedBox(width: 10),
            if (isDesktop(context))
              TextButton.icon(
                icon: Icon(Icons.code),
                label: Text('New Pad'),
                onPressed: () {},
              ),
            TextButton.icon(
              icon: Icon(Icons.refresh),
              label: Text('Reset'),
              onPressed: () {},
            ),
            if (isDesktop(context)) ...[
              TextButton.icon(
                icon: Icon(Icons.format_align_left),
                label: Text('Format'),
                onPressed: () {},
              ),
              TextButton.icon(
                icon: Icon(Icons.get_app),
                label: Text('Install SDK'),
                onPressed: () {},
              ),
            ],
            Spacer(),
            if (MediaQuery.of(context).size.width > 700) ...[
              Text('Title',
                  overflow: TextOverflow.fade,
                  textWidthBasis: TextWidthBasis.parent),
              Spacer(),
            ],
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: PopupMenuButton<String>(
                offset: Offset(0, 40),
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
                  _dropDownItem('Hello World', DartIcon()),
                  _dropDownItem('Int to Double', DartIcon()),
                  _dropDownItem('Mixins', DartIcon()),
                  _dropDownItem('Fibonacci', DartIcon()),
                  _dropDownItem('Counter', FlutterIcon()),
                  _dropDownItem('Sunflower', FlutterIcon()),
                  _dropDownItem('Draggables & physics', FlutterIcon()),
                  _dropDownItem('Implicit animations', FlutterIcon()),
                ],
                onSelected: (value) {},
              ),
            ),
            PopupMenuButton(
              offset: Offset(0, 40),
              child: Icon(Icons.more_vert, color: Colors.white),
              itemBuilder: (context) => [
                _dropDownItem('Share', Icon(Icons.launch)),
                _dropDownItem('DartPad on GitHub', Icon(Icons.launch)),
                _dropDownItem('dart.dev', Icon(Icons.launch)),
                _dropDownItem('flutter.dev', Icon(Icons.launch)),
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
            padding: const EdgeInsets.only(right: 8.0, top: 8),
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(color: playground_background_color),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: CodeField(
                    controller: _codeController,
                    textStyle: GoogleFonts.robotoMono(
                        fontWeight: FontWeight.w300, fontSize: 15),
                  ),
                ),
                Positioned.directional(
                  textDirection: TextDirection.ltr,
                  end: 10,
                  top: 0,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: button_color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      padding: EdgeInsets.only(
                          left: 20, top: 16, bottom: 16, right: 30),
                    ),
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    color: playground_background_color,
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
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                flex: 1,
                child: Container(
                  color: playground_background_color,
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
              ),
            ],
          ),
        )
      ]),
      persistentFooterButtons: [
        Container(
          color: playground_footer_background_color,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              if (isDesktop(context))
                IconButton(
                  icon: SvgPicture.asset('assets/pictures/keyboard.svg'),
                  onPressed: () {},
                ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                ),
                child: Text('Privacy notice'),
                onPressed: () {},
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                ),
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
