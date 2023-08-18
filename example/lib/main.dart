import 'package:flutter/material.dart';
import 'package:ui_kit_test/ui_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.purple,
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
        extensions: const <ThemeExtension>[
          UiKitThemeData(
            labelTheme: LabelThemeData(
              backgroundColor: Colors.green,
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              textStyle: TextStyle(
                color: Colors.white,
              ),
              iconTheme: SvgIconThemeData(
                color: Colors.white,
              ),
            ),
          ),
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
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LabelTheme(
                data: LabelThemeData.fromDefaults(context),
                child: Label(
                  text: const Text('Label - from defaults'),
                  icon: SvgIcon.asset(
                    'assets/icons/info.svg',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Label(
                text: const Text('Label - app theme extension'),
                icon: SvgIcon.asset(
                  'assets/icons/info.svg',
                ),
              ),
              const SizedBox(height: 16),
              LabelTheme(
                data: const LabelThemeData(
                  backgroundColor: Colors.amber,
                ),
                child: Label(
                  text: const Text('Label - wrapped by label theme'),
                  icon: SvgIcon.asset(
                    'assets/icons/info.svg',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Label(
                text: const Text('Label - constructor attributes'),
                icon: SvgIcon.asset(
                  'assets/icons/info.svg',
                ),
                backgroundColor: Colors.tealAccent,
                textStyle: const TextStyle(
                  color: Colors.red,
                ),
                iconTheme: const SvgIconThemeData(
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
