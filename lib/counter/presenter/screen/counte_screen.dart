import 'package:empty/container.dart';
import 'package:empty/counter/presenter/bloc/counter_bloc.dart';
import 'package:empty/counter/presenter/widget/counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      lazy: false,
      create: (context) => locator<CounterBloc>()..add(GetCounter()),
      child: const Scaffold(
        body: CounterWidget(),
      ),
    );
  }
}
