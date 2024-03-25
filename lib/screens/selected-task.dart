import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:orientation/screens/map.dart';

class SelectedTask extends StatelessWidget {
  final LatLng destination; // accept the destination coordinates
  const SelectedTask(
      {super.key,
      required this.destination}); // the constructor to accept the destination

  final String _taskName = "Find Cooper Library";
  final String _taskDescription =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  final String _taskImg = "assets/img/cooper2.jpg";

  void activateTask() {
    return;
  }

  @override
  Widget build(BuildContext context) {
    return (CupertinoPageScaffold(
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: CupertinoColors.black.withOpacity(1),
                  image: DecorationImage(
                      image: AssetImage(_taskImg),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                        CupertinoColors.black.withOpacity(0.5),
                        BlendMode.darken,
                      ))),
              child: Stack(children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(CupertinoIcons.back, size: 30),
                    color: CupertinoColors.white,
                    onPressed: () {
                      // go back to previous page
                      Navigator.pop(context);
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(_taskName,
                      style: const TextStyle(
                        fontSize: 32,
                        color: CupertinoColors.white,
                      )),
                ),
              ])),
          Expanded(
              child: ListView(shrinkWrap: true, children: <Widget>[
            Container(
                alignment: Alignment.topCenter,
                height: 400,
                width: double.infinity,
                margin: const EdgeInsets.all(20),
                child: Text(_taskDescription,
                    style: const TextStyle(
                      fontSize: 16,
                      color: CupertinoColors.black,
                    ))),
            Container(
                alignment: Alignment.bottomCenter,
                child: CupertinoButton.filled(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              Mapper(destination: destination)),
                    );
                  },
                  child: const Text("Activate Task"),
                ))
          ]))
        ],
      )),
    ));
  }
}
