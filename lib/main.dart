import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'selected-objective.dart';
import 'objective-view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'OrientAR',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue,
        textTheme: CupertinoTextThemeData(
            textStyle: TextStyle(
                fontSize: 14,
                color: CupertinoColors.black
              )
        ),
      ),
      home: ObjectiveView(),                    
    )
    ;
  }
}
