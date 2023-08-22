import 'package:empty/counter/presenter/widget/counter_widget.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CounterWidget(),
    );
  }
}
