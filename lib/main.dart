import "package:brainbridge/Screens/register.dart";
import "package:brainbridge/provider/counter.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'package:brainbridge/Screens/games_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => CountProvider()),
    ], child: MaterialApp(home: GamesScreen()));
  }
}
