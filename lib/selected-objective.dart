import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SelectedObject extends StatefulWidget {
  const SelectedObject({super.key});

  @override
  State<SelectedObject> createState() => _SelectedObjectState();
}

class _SelectedObjectState extends State<SelectedObject> {
  final ScrollController _posController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return (CupertinoPageScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: CupertinoColors.black.withOpacity(1),
                image: DecorationImage(
                    image: const AssetImage("assets/img/cooper2.jpg"),
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(
                    CupertinoColors.black.withOpacity(0.5),
                      BlendMode.darken,
                    )
                )
            ),
            child: const Center(
              child: Text(
                'Find Cooper Library',
                textDirection: TextDirection.ltr,
                style: TextStyle (
                  fontSize: 32,
                  color: CupertinoColors.white,
                )
              ),
            ),
          ),
          CupertinoScrollbar(
            thumbVisibility: true,
            controller: _posController,
            child: ListView(
              controller: _posController,
              shrinkWrap: true,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  height: 400,
                  width: double.infinity,
                  margin: const EdgeInsets.all(20),
                  child: const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    textDirection: TextDirection.ltr,
                    style: TextStyle (
                      fontSize: 16,
                      color: CupertinoColors.black,
                    )
                  )
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: CupertinoButton.filled(
                    onPressed: () {},
                    child: const Text("Activate Task"),
                  )  
                )               
              ]  
            )
          )             
        ],
      ),
    )
    );
  }
}
