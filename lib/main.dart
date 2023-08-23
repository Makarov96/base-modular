import 'package:empty/container.dart';
import 'package:empty/counter/presenter/screen/counte_screen.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding();
  await init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterScreen(),
    );
  }
}
