import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            showFirstModal(context);
          },
          color: Colors.blueAccent,
          child: const Text('Open First Modal'),
        ),
      ),
    );
  }

  showFirstModal(BuildContext firstModalContext) {
    showModalBottomSheet<String>(
      context: firstModalContext,
      builder: (firstContext) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'First Modal',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
              width: 20,
            ),
            MaterialButton(
              onPressed: () async {
                final result = await showSecondModal(firstModalContext);
                print(result);
              },
              color: Colors.blueAccent,
              child: const Text('Open Modal'),
            ),
          ],
        ),
      ),
    );
  }

  showSecondModal(BuildContext secondModalContext) async {
    return await showModalBottomSheet<String>(
      context: secondModalContext,
      builder: (secondContext) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Second Modal',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
              width: 20,
            ),
            MaterialButton(
              onPressed: () async {
                final result = await showThirdModal(secondContext);
                print(result);
              },
              color: Colors.blueAccent,
              child: const Text('Open Modal'),
            ),
            const SizedBox(
              width: 20,
            ),
            MaterialButton(
              onPressed: () async {
                Navigator.of(secondContext).pop('second modal popped');
                final result = await showThirdModal(secondContext);
                print(result);
              },
              color: Colors.blueAccent,
              child: const Text('Close Modal'),
            ),
          ],
        ),
      ),
    );
  }

  showThirdModal(BuildContext thirdModalContext) async {
    return await showModalBottomSheet<String>(
      context: thirdModalContext,
      builder: (thirdContext) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Third Modal',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
              width: 20,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(thirdModalContext).pop('Third modal popped');
              },
              color: Colors.blueAccent,
              child: const Text('Close Modal'),
            ),
            const SizedBox(
              width: 20,
            ),
            MaterialButton(
              onPressed: () async {
                final result = await showSecondModal(thirdModalContext);
                print(result);
              },
              color: Colors.blueAccent,
              child: const Text('Open Second Modal'),
            ),
          ],
        ),
      ),
    );
  }
}
