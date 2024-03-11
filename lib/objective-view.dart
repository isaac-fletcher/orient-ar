import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ObjectiveView extends StatefulWidget {
  const ObjectiveView({super.key});

  @override
  State<ObjectiveView> createState() => _ObjectiveViewState();
}

class _ObjectiveViewState extends State<ObjectiveView> {

  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (CupertinoPageScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container (
            padding: const EdgeInsets.only(top: 40.0),
            alignment: Alignment.topCenter,
            child: const Text(
              "Objective List",
              style: TextStyle (
                    fontSize: 32,
                    color: CupertinoColors.black,
              )
            )
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CupertinoSearchTextField(
                controller: textController,
                placeholder: 'Search',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton.filled(
                onPressed: () {},
                child: const Text("Active"),
              ),
              CupertinoButton.filled(
                onPressed: () {},
                child: const Text("Completed"),
              )
            ],
            ),
            ListView(
              shrinkWrap: true,
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: CupertinoColors.activeBlue),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("This\t"),
                      Text("is\t"),
                      Text("a\t"),
                      Text("test")
                    ],
                  )  
                )
              ]        
            )
        ],
      ),
    )
    );
  }
}
