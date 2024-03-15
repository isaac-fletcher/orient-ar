import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:io'; // Add this import statement
import '../widgets/player-card.dart';

class LeaderboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(
          previousPageTitle: 'Back',
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        middle: Text('Leaderboard'),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                PlayerCard(rank: 2, name: 'John Doe', score: 9999,imagePath: 'assets\img\profilepic.jpg'),
                PlayerCard(rank: 1, name: 'Mr Mills', score: 10000,imagePath: 'assets\img\profilepic.jpg'),
                PlayerCard(rank: 3, name: 'Alice Johnson', score: 9998,imagePath: 'assets\img\profilepic.jpg'),
              ],
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(45, (index) {
                    final playerRank = index + 4;
                    final playerName = 'Player $playerRank';
                    final playerScore = 1000 - (index * 10); // Generate scores from 1000 to 750
                    final playerImagePath = 'assets\img\profilepic.jpg'; // Replace with actual image path


                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('$playerName', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text('Score: $playerScore', style: TextStyle(fontSize: 20.0)),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

