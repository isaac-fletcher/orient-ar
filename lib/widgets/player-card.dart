import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// This is for the top 3 cards. I am trying to implement this to the bottom half but have confusin
class PlayerCard extends StatelessWidget {
  final int rank;
  final String name;
  final int score;
  final String imagePath; // New field for the image path

  const PlayerCard({Key? key, required this.rank, required this.name, required this.score, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (rank) {
      case 1:
        color = Colors.amber;
        break;
      case 2:
        color = Colors.grey;
        break;
      case 3:
        color = Colors.brown;
        break;
      default:
        color = Colors.grey[200]!;
    }

    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: color,
      ),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage(imagePath), // Display the profile picture
          ),
          SizedBox(height: 8.0), 
          Text(
            'Rank $rank',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(name),
          SizedBox(height: 4.0),
          Text('Score: $score'),
        ],
      ),
    );
  }
}
