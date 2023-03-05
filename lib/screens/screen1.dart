import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/Provider/patients_tab.dart';
import 'package:provider_practice/screens/screen2.dart';

List<int> intArray = [1, 2, 3, 4, 5];

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  // final String url;
  static var routeName = '/screen1';

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: IndexedStack(
              index: index,
              children: [
                Container(
                  padding: EdgeInsets.all(25.0),
                  color: Colors.redAccent,
                  child: Column(
                    children: [
                      Text(
                        "Text 1",
                        style: TextStyle(fontSize: 50.0),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            index = 2;
                          });
                        },
                        child: Text(
                          "Delete this item from the Array",
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(25.0),
                  color: Colors.greenAccent,
                  child: Text(
                    "Text 2",
                    style: TextStyle(fontSize: 50.0),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(25.0),
                  color: Colors.cyanAccent,
                  child: Text(
                    "Text 3",
                    style: TextStyle(fontSize: 50.0),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    index = 0;
                  });
                },
                child: Text(
                  "Screen1",
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    index = 1;
                  });
                },
                child: Text(
                  "Screen2",
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    index = 2;
                  });
                },
                child: Text(
                  "Screen3",
                ),
              ),
              TextButton(
                onPressed: () {
                  intArray.add(intArray.length);
                },
                child: Text(
                  "Add to the array",
                ),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (index == 3) {
              print("Now index is equal to 3");

              index = 0;
              print(
                  "Changed index value to Zero and index variable becoms: $index");
            } else {
              print("Index value before $index");
              ++index;
              print("Index value after $index");
            }
          });
        },
        child: Icon(Icons.change_circle),
      ),
    );
  }
}

// Show details of the last selected patient here.