import 'package:cruv_task/bloc/seats_finder_bloc.dart';
import 'package:cruv_task/screens/seats_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => SeatsFinderBloc(),
        child: const SeatsPage(),
      ),
    );
  }
}
