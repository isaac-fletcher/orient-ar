import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {},
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Icon(CupertinoIcons.star_fill),
                  onPressed: () {},
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
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text("No Active Task", style: TextStyle(fontSize: 28)),
                )
              ],
            ),
          ),
          body: const Center(
            child: Text(
              "Map here",
              style: TextStyle(color: Colors.white),
            ),
          )),
    );
  }
}
