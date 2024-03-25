import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:orientation/screens/leader.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:orientation/screens/task-list.dart';
import 'package:orientation/screens/map.dart';
import 'package:orientation/screens/store.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    //default LatLng instance if you want to show a default location
    final LatLng defaultDestination = LatLng(34.67833, -82.83917);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Row(children: [
          const Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("\$1647"),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Icon(CupertinoIcons.shopping_cart),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   CupertinoPageRoute(builder: (context) => Store())
                    // );
                  },
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Icon(CupertinoIcons.star_fill),
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => LeaderboardScreen()));
                  },
                )
              ]),
            ),
          ),
        ]),
      ),
      child: SlidingUpPanel(
          backdropEnabled: true,
          color: Colors.transparent,
          maxHeight: MediaQuery.of(context).size.height - 80,
          panel: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  border: Border.all(
                    color: Colors.white,
                    width: 5,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: const TaskList()),
          body: Mapper(destination: defaultDestination)),
    );
  }
}
