import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:orientation/screens/selected-task.dart';
import 'package:orientation/screens/map.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key});

  // Example list of destinations -
  static final List<LatLng> destinations = [
    LatLng(34.93444, -81.02444), //Tillman Hall
    LatLng(34.67861, -82.84306), //Clemson Memorial Stadium
    LatLng(34.675556, -82.8345), // McAdams Hall
    LatLng(34.679333, -82.835194), //Strode Hall
    LatLng(
        34.680306, -82.834694), // Willbur O and Ann Power College of Business
    LatLng(34.676639, -82.836444), //Cooper Library
    LatLng(
        34.675389, -82.839361), //Fluor Daniel Engineering Innovation Building
    LatLng(34.676139, -82.838) //Freeman Hall
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) => SelectedTask(destination: destinations[0])),
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
            child: const Center(
                child: Text('700',
                    style: TextStyle(
                        fontSize: 18.0, color: CupertinoColors.white))),
          ),
          const Padding(padding: EdgeInsetsDirectional.only(end: 20.0)),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Task Name',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.black)),
              Text('Location',
                  style:
                      TextStyle(fontSize: 16.0, color: CupertinoColors.black)),
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
