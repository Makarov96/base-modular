import 'package:empty/counter/presenter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlocConsumer<CounterBloc, CounterState>(
          listener: (context, state) {
            if (state is CounterError) {
              var snackBar = const SnackBar(content: Text('Hello World'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            if (state is CounterLoading) {
              return const Center(child:  CircularProgressIndicator());
            } else if (state is CounterLoaded) {
              return Center(
                child: Text('${state.entity.intCounter}'),
              );
            } else if (state is CounterError) {
              return Text(state.message);
            } else {
              return const Center(child:  CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }
}
