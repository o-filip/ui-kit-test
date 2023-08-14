import 'package:flutter/material.dart';
import 'package:ui_kit_test/ui_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.yellow,
          secondary: Colors.green,
          background: Colors.white,
          surface: Colors.white,
          onBackground: Colors.black,
          onSurface: Colors.black,
          onError: Colors.white,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          error: Colors.red,
        ),
        useMaterial3: true,
        chipTheme: ChipThemeData.fromDefaults(
          secondaryColor: Colors.red,
          brightness: Brightness.light,
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
        ),
        extensions: const <ThemeExtension>[
          LabelThemeData(
            backgroundColor: Colors.teal,
          ),
          // UiKitThemeData(
          //   labelTheme: LabelThemeData(
          //     backgroundColor: Colors.purple,
          //   ),
          // ),
        ],
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Label(
            text: Text('Label'),
            icon: Icon(Icons.label),
          ),
        ),
      ),
    );
  }
}
