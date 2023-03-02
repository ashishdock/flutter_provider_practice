import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider_practice/list.dart';
import 'package:provider_practice/Provider/patients_tab.dart';
// import 'package:provider_practice/controllers/fetchList.dart';
// import 'package:provider_practice/Provider/patient_search_list.dart';
import 'package:provider_practice/screens/screen1.dart';
import 'package:provider_practice/screens/screen2.dart';
import 'package:provider_practice/screens/screen3.dart';
import 'package:provider_practice/screens/screen4.dart';
import 'package:provider_practice/screens/screen5.dart';
import 'package:provider_practice/screens/screen6.dart';

void main() {
  runApp(
    // MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(
    //       create: (context) {
    //         PatientsTab();
    //       },
    //     )
    //   ],
    // child:
    const MyApp(),
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: PatientsTab(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: "Flutter Demo Home Page"),
        routes: {
          PatientList.routeName: (context) => PatientList(),
          Screen1.routeName: (context) => Screen1(),
          Screen2.routeName: (context) => Screen2(),
          Screen3.routeName: (context) => Screen3(),
          Screen4.routeName: (context) => Screen4(),
          Screen5.routeName: (context) => Screen5(),
          Screen6.routeName: (context) => Screen6(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  // const MyHomePage({super.key, required this.title});  // old value

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
                Navigator.pushNamed(context, PatientList.routeName,
                    arguments: PatientListArguments(
                        'https://jsonplaceholder.typicode.com/users'));
                // url: 'https://jsonplaceholder.typicode.com/users'
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
