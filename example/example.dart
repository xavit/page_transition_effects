import 'package:flutter/material.dart';
import 'package:page_transition_effects/page_transition_effects.dart';

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
      title: 'Page Transition Demo',
      theme: ThemeData.dark(),
      home: const MyFirstPage(),
    );
  }
}

class MyFirstPage extends StatelessWidget {
  const MyFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SizedBox(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'My First Page',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            ElevatedButton(
              onPressed: () => PageTransitionEffects(
                context: context,
                page: const MySecondPage(),
                animation: AnimationType.slideUp,
                duration: const Duration(milliseconds: 800),
              ),
              child: const Text('Push Normal'),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            ElevatedButton(
              onPressed: () => PageTransitionEffects(
                context: context,
                page: const MyThirdPage(),
                animation: AnimationType.slideDown,
                duration: const Duration(milliseconds: 800),
                replacement: true,
              ),
              child: const Text('Push Replacement'),
            )
          ],
        ),
      ),
    );
  }
}

class MySecondPage extends StatelessWidget {
  const MySecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        title: const Text('Button Back Activated'),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Text(
          'My Second Page',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}

class MyThirdPage extends StatelessWidget {
  const MyThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: const Text('Button Back Deactivated'),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Text(
          'My Third Page with Button Back Deactivated',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
