import 'dart:async';
import 'package:flutter/material.dart';

import 'package:provider_practice/list.dart';
// import './controllers/fetchList.dart';
// import './Provider/patient_search_list.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: "Flutter Demo Home Page"),
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
  int _counter = 0;

  late final StreamController<int> streamController = StreamController<int>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    streamController.close();
    print("Dispose called");
  }

  @override
  Widget build(BuildContext context) {
    print("widget built");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<int>(
              stream: streamController.stream,
              builder: (context, snapshot) {
                print("Text widget built");
                return Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return PatientList(
                      url: 'https://jsonplaceholder.typicode.com/users',
                    );
                  },
                ));
              },
              child: const Text("Get List"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          streamController.add(_counter++);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
