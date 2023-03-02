import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/screens/screen7.dart';

import 'screen2.dart';
import '../Provider/patients_tab.dart';

class Screen6 extends StatefulWidget {
  const Screen6({super.key});

  static var routeName = '/screen6';

  @override
  State<Screen6> createState() => _Screen6State();
}

class _Screen6State extends State<Screen6> with TickerProviderStateMixin {
  late TabController _tabController;

  List<Tab> myTabs = [];

  // List<String> tabNames = [
  //   "fname lname",
  //   "longFName longLName testingggggggg",
  //   "",
  //   "fname lname",
  //   "fname lname",
  //   "fname lname",
  //   "fname lname",
  //   "fname lname",
  //   "fname lname",
  //   "fname lname",
  //   "fname lname",
  //   "fname lname",
  // ];

// print('${context.watch<PatientsTab>().patientList}');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _tabController = TabController(
    //     length: context.watch<PatientsTab>().patientList.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _tabController = TabController(
        length: context.watch<PatientsTab>().patientList.length, vsync: this);
    //! using Ticker... instead of SingleTicker because of the below exception
    //! FlutterError (_Screen6State is a SingleTickerProviderStateMixin but multiple tickers were created.
//A SingleTickerProviderStateMixin can only be used as a TickerProvider once.
//If a State is used for multiple AnimationController objects, or if it is passed to other objects and those objects might use it more than one time in total, then instead of mixing in a SingleTickerProviderStateMixin, use a regular TickerProviderStateMixin.)

    List<String> tabNames = context
        .watch<PatientsTab>()
        .patientList
        .map((patient) => patient.name)
        .toList();

    return Scaffold(
      body: RotatedBox(
        quarterTurns: 1,
        child: Column(
          children: [
            SizedBox(
              height: 150.0,
              child: TabBar(
                tabs: tabNames
                    .map((label) => SingleTabRotated(label: label))
                    .toList(),
                controller: _tabController,
                dividerColor: Colors.blue,
                labelColor: Colors.black,
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
                // indicatorColor: Colors.yellow,
                // indicatorSize: TabBarIndicatorSize,
                indicatorWeight: 5.0,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 3.0,
            ),
            Expanded(
              child: RotatedBox(
                quarterTurns: -1,
                child: TabBarView(
                  controller: _tabController,
                  children: tabNames
                      .map((label) => Screen7())
                      .toList(), // Whatever is populated here should have a unique key()
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleTabRotated extends StatelessWidget {
  const SingleTabRotated({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      key: UniqueKey(),
      child: Tab(
        text: label,
      ),
    );
  }
}
