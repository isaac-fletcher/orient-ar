import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orientation/widgets/reward-card.dart';

class RewardsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Rewards Page'),
      ),
      child: ListView(
        children: <Widget>[
          RewardOption(
            title: 'Chick-fil-A Gift Card: \$10',
            description: 'Ten dollar gift card to Chick-fil-A.',
            pointValue: '100',
            onTap: () {
              //placeholder
            },
          ),
          RewardOption(
            title: 'Starbucks Gift Card: \$10',
            description: 'Ten dollar gift card to Starbucks.',
            pointValue: '100',
            onTap: () {
              //placeholder
            },
          ),
          RewardOption(
            title: 'Starbucks Gift Card: \$20',
            description: 'Twenty dollar gift card to Starbucks.',
            pointValue: '180',
            onTap: () {
              //placeholder
            },
          ),
        ],
      ),
    );
  }
}