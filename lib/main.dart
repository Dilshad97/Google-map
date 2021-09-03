import 'package:flutter/material.dart';

import 'Drop_Down.dart';
import 'Google_Map.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home:DropDownList(),
    );
  }
}
