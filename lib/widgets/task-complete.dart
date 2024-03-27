import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class TaskComplete extends StatelessWidget {
  final String taskName;
  final int points;
  const TaskComplete({Key? key, required this.taskName, required this.points})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPopupSurface(
      child: Container(
          color: CupertinoColors.white,
          alignment: Alignment.center,
          width: double.infinity,
          height: 300,
          child: Center(
              child: Column(
            children: [
              const SizedBox(
                height: 35,
              ),
              const Text("Task Complete!",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 48.0)),
              const SizedBox(
                height: 15,
              ),
              Text(taskName,
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 24.0)),
              const SizedBox(
                height: 20,
              ),
              Text("+\$$points",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0)),
              const SizedBox(
                height: 20,
              ),
              CupertinoButton.filled(
                child: const Text("Dismiss"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ))),
    );
  }
}
