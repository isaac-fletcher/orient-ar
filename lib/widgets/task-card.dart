import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:orientation/screens/selected-task.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => const SelectedTask())
        );
          
      },
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 25,
            decoration: BoxDecoration(
              color: CupertinoColors.systemRed,
              border: Border.all(
                color: CupertinoColors.systemRed,
              ),
            borderRadius: BorderRadius.circular(4.0),
            ),
            child: const Center(
              child: Text('700', style: TextStyle(fontSize: 18.0, color: CupertinoColors.black))
            ),
          ),
          const Padding(padding: EdgeInsetsDirectional.only(end: 20.0)),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Task Name', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color:CupertinoColors.black)),
              Text('Location', style: TextStyle(fontSize: 16.0, color:CupertinoColors.black)),
            ],
          ),
          const Spacer(),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.location_fill,
                color: CupertinoColors.lightBackgroundGray,
                size: 23.0,
              ),
              Text('10m', style: TextStyle(fontSize: 14.0, color:CupertinoColors.black)),
            ],
          )
          ],
      ),
    );
  }
}
