import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/screens/layout_screen/layout_screen.dart';
import 'package:movies/styles/theming/theme.dart';

import 'bloc/my_bloc_observer/bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.myDarkTheme,
      routes: {
        LayoutScreen.routName : (c)=>LayoutScreen(),
      },
      initialRoute: LayoutScreen.routName,
    );
  }
}


