import 'package:flutter/material.dart';

class DartPadTheme {
  static ThemeData get dartPadTheme {
    print(dark_code_background_color);
    print(dark_selection_color);
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: dark_gutter_background_color,
      primaryColor: button_color,
      accentColor: Color(0xff676767),
      buttonColor: button_color,
      textSelectionColor: dark_selection_color,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(
        color: playground_header_background_color,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      buttonBarTheme: ButtonBarThemeData(
        buttonPadding: EdgeInsets.zero,
      ),
    );
  }
}

// light + dark colors
final label_color = Color(0xff808080);
final scrollbar_color = label_color;

// errors and warnings
final issue_error_color = Color(0xffF7977A);
final issue_warning_color = Color(0xffFFF79A);
final issue_info_color = Color(0xff7EA7D8);
final squiggle_error_color = Color(0xffF7977A);
final squiggle_warning_color = Color(0xffFFF79A);
final squiggle_info_color = Color(0xff7EA7D8);

// Playground
final playground_background_color = Color(0xff12202f);
final playground_text_color = Color(0xffffffff);
final playground_link_color = Color(0xffcccccc);
final playground_header_background_color = Color(0xff1c2834);
final playground_footer_background_color = Color(0xff27323a);

Color rgba(int r, int g, int b, double a) {
  return Color.fromARGB((a * 255).toInt(), r, g, b);
}

Color lighten(Color oldColor, int percentage) {
  final amount = percentage * 255 ~/ 100;
  var r = oldColor.red + amount;
  if (r > 255) r = 255;
  var b = oldColor.blue + amount;
  if (b > 255) b = 255;
  var g = oldColor.green + amount;
  if (g > 255) g = 255;
  return Color.fromARGB(oldColor.alpha, r, g, b);
}

Color darken(Color oldColor, int percentage) {
  final amount = percentage * 255 ~/ 100;
  var r = oldColor.red - amount;
  if (r < 0) r = 0;
  var b = oldColor.blue - amount;
  if (b < 0) b = 0;
  var g = oldColor.green - amount;
  if (g < 0) g = 0;
  return Color.fromARGB(oldColor.alpha, r, g, b);
}

Color desaturate(Color oldColor, int amount) {
  var color = HSVColor.fromColor(oldColor);
  var newColor = HSVColor.fromAHSV(
      color.alpha, color.hue, color.saturation - amount, color.value);
  return newColor.toColor();
}

final light_text_color = Color(0xff808080);
final light_code_background_color = Colors.white;
final light_busy_background_color = rgba(255, 255, 255, .5);
final light_secondary_background_color = Color(0xfff7f7f7);
final light_label_color = Color(0xff586069);
final light_gutter_background_color = lighten(Colors.grey, 45);
final light_border_color = light_gutter_background_color;
final light_issue_label_color = darken(light_text_color, 30);
final light_flash_info_color = Color(0xffe7f8ff);
final light_flash_success_color = Color(0xffe7fff8);
final light_flash_warning_color = Color(0xfffff8e7);
final light_flash_error_color = Color(0xffffe7f8);

final dark_text_color = Color(0xff9e9e9e);
final dark_code_background_color = playground_background_color;
final dark_busy_background_color = rgba(27, 29, 33, .8);
final dark_secondary_background_color = dark_code_background_color;
final dark_gutter_background_color = Color(0xff121a25);
final dark_border_color = dark_gutter_background_color;
final dark_issues_background_color = lighten(dark_code_background_color, 20);
final dark_issue_label_color = Color(0xffe6e6e6);
final dark_flash_text_color = dark_issue_label_color;
final dark_flash_info_color = Color(0xff2f3a41);
final dark_flash_success_color = Color(0xff2b413a);
final dark_flash_warning_color = Color(0xff413a31);
final dark_flash_error_color = Color(0xff41333a);

// V2 Colors
final button_color = Color(0xff168AFD);
final secondary_color = Color(0xff676767);
final grey_1 = Color(0xff1c2834);
final grey_2 = Color(0xff27323A);
final grey_3 = Color(0xff12202F);

final dark_green = darken(desaturate(Color(0xff50E191), 20), 5);
final dark_blue = darken(desaturate(Color(0xff00d2fa), 20), 5);
final dark_pink = darken(desaturate(Color(0xffFA557d), 20), 5);
final dark_teal = darken(desaturate(Color(0xff55a09b), 20), 5);
final dark_orange = darken(desaturate(Color(0xffff916e), 20), 5);
final dark_red = darken(desaturate(Color(0xffff2d64), 20), 5);
final dark_pink_2 = darken(desaturate(Color(0xffff00fA), 20), 5);
final dark_orange_2 = darken(desaturate(Color(0xffff9b00), 20), 5);
final dark_editor_text = darken(desaturate(Color(0xffc4cedb), 20), 5);
final dark_comment = darken(desaturate(Color(0xff909cce), 20), 5);
final dark_line_count = darken(desaturate(Color(0xff414c58), 20), 5);
final dark_gutter_line_number_color = dark_text_color;
final dark_selection_color = lighten(dark_code_background_color, 10);

final light_green = Color(0xff007a27);
final light_blue = Color(0xff00677a);
final light_pink = Color(0xffbc0056);
final light_teal = Color(0xff00786d);
final light_dark_blue = Color(0xff2f4960);
final light_red = Color(0xffa54a78);
final light_pink_2 = Color(0xff983ab3);
final light_red_2 = Color(0xffd32923);
final light_editor_text = Color(0xff4a4a4a);
final light_comment = Color(0xff929292);
final light_line_count = Color(0xffd5d5d5);
final light_gutter_line_number_color = Color(0xffd0d0d2);
final light_selection_color = darken(light_code_background_color, 7);
