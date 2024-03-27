import 'package:flutter/material.dart';
import 'package:subhapradha_holdings_assessment/components/height_spacer.dart';
import 'package:subhapradha_holdings_assessment/components/my_button.dart';
import 'package:subhapradha_holdings_assessment/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
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
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("1. After Clicking Start button screen will load 3 seconds and will change to the second Screen"),
            const Text("2. Click on Upload case file to open bottom sheet"),
            const Text("3. Click on 5/10 text you'll see a dialog box"),
            const Text("4. Click on i button in the top of the screen to see the last mentioned Screen"),
            HSpacer(height: 20),
            MyButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                btnText: 'Click Me'),
          ],
        ),
      ),
    );
  }
}
