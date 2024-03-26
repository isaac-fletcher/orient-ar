import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:orientation/screens/selected-task.dart';
import 'package:orientation/screens/map.dart';

class TaskCard extends StatelessWidget {

  final LatLng coordinates; 
  final String destination; 
  final String taskName; 
  final String taskDescription;
  final String taskImg;
  final int value;

  const TaskCard(
    {
      super.key,
      required this.destination,
      required this.coordinates,
      required this.taskName,
      required this.taskDescription,
      required this.taskImg,
      required this.value,
    }
  );

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => SelectedTask(
              coordinates: coordinates,
              taskName: destination,
              taskDescription: taskDescription,
              taskImg: taskImg
            )
          ),
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
              color: CupertinoColors.activeBlue,
              border: Border.all(
                color: CupertinoColors.activeBlue,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Center(
                child: Text(value.toString(),
                    style: const TextStyle(
                        fontSize: 18.0, color: CupertinoColors.white))),
          ),
          const Padding(padding: EdgeInsetsDirectional.only(end: 20.0)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(taskName,
                  style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.black)),
              Text(destination,
                  style:
                      const TextStyle(fontSize: 16.0, color: CupertinoColors.black)),
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
              Text('10m',
                  style:
                      TextStyle(fontSize: 14.0, color: CupertinoColors.black)),
            ],
          )
        ],
      ),
    );
  }
}
