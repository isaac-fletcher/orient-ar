import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:orientation/widgets/task-card.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {

  late TextEditingController textController;
  final isSelected = <bool>[false,false];

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
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: CupertinoSearchTextField(
                controller: textController,
                placeholder: 'Search',
              ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToggleButtons(
                color: Colors.black.withOpacity(0.60),
                selectedColor: CupertinoColors.activeBlue,
                selectedBorderColor: CupertinoColors.activeBlue,
                fillColor: CupertinoColors.activeBlue.withOpacity(0.08),
                splashColor: CupertinoColors.activeBlue.withOpacity(0.12),
                hoverColor: CupertinoColors.activeBlue.withOpacity(0.04), 
                borderRadius: BorderRadius.circular(4.0),
                constraints: const BoxConstraints(minHeight: 36.0, minWidth: 20.0),
                isSelected: isSelected,
                onPressed: (index) {
                    // Respond to button selection
                    setState(() {
                        isSelected.fillRange(0, isSelected.length, false);
                        isSelected[index] = true;
                    });
                },
                children: const [
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text('Active'),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text('Completed'),
                    ),
                ],
              )
            ],
          ),
          Expanded(
            child: CupertinoScrollbar(
              child: SingleChildScrollView(
              child: Column(
                children: List.generate(100, (index) {
                  return const TaskCard();
                })
              ),
            ),
            ),
          ),
        ],
      ),
    )
    );
  }
}
