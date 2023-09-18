import 'package:flutter/widgets.dart';
import 'package:todo/pages/home_page.dart';

class Routes {
  Routes._();

  static const String home = '/home';

  static final routes = <String, WidgetBuilder>{
    home: (context) => const HomePage(),
  };
}
