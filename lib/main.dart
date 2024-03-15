import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:orientation/screens/login.dart';
import 'package:orientation/screens/selected-task.dart';
import 'package:orientation/screens/task-list.dart';
import 'package:orientation/screens/home.dart';

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
      home: LoginPage(),                    
    )
    ;
  }
}
