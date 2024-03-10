import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class Selected extends StatelessWidget {
  const Selected({super.key});

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
                        image: AssetImage("assets/img/cooper2.jpg"),
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
              const Center(  
                child: Text(
                  'Lorem Ipsum',
                  textDirection: TextDirection.ltr,
                  style: TextStyle (
                    fontSize: 32,
                    color: CupertinoColors.black,
                  )
                )    
                )               
            ],
          ),
      )
    );
  }
}
