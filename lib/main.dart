import 'package:flutter/material.dart';

import 'auto_complete_search_list/AutoCompleteSearchScreen.dart';
import 'custome_animation/CustomAnimationScreen.dart';
import 'expansion_panel_list/ExpansionPanelList.dart';
import 'image_to_text/ImageToTextScreen.dart';
import 'lottie_animation/LottieAnimationScreen.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AutoCompleteSearchScreen(),
                  ),
                );
              },
              child: const Text("Auto-Complete Search List"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ImageToTextAppScreen(),
                  ),
                );
              },
              child: const Text("Image to Text"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LottieAnimationScreen(),
                  ),
                );
              },
              child: const Text("Lottie Animation"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CustomAnimationDemo(),
                  ),
                );
              },
              child: const Text("Custom Animation"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExpansionPanelListScreen(),
                  ),
                );
              },
              child: const Text("ExpansionPanelList"),
            ),
          ],
        ),
      ),
    );
  }
}
