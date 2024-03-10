import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'selected.dart';

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
              textTheme: CupertinoTextThemeData(
                  textStyle: TextStyle(
                      fontSize: 14,
                      color: CupertinoColors.black
                    )
              ),
      ),
      home: Selected(),                    
    )
    ;
  }
}
