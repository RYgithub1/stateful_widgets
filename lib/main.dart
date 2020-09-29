import 'package:flutter/material.dart';
import 'category_route.dart';



void main() {
  runApp(UnitConverterApp());
}



/// each [Categories] has a list of [Unit]s.
class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      home: CategoryRoute(),
    );
  }
}
