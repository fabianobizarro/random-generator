import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_generator/src/models/numbers_bloc.dart';
import 'package:random_generator/src/pages/home.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider<NumbersBloc>(
        create: (context) => NumbersBloc(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
