import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(6, (index) {
        // This is a list of your icons and titles
        final icons = [
          Icons.privacy_tip,
          Icons.account_balance_wallet,
          Icons.av_timer,
          Icons.bar_chart,
          Icons.person,
          Icons.card_giftcard,
          Icons.lock,
          Icons.delete,
        ];
        final titles = [
          "Privacy",
          "Balance",
          "Availability",
          "Levels",
          "Profile",
          "Vouchers",
          "Change password",
          "Delete account",
        ];

        return Card(
          margin: EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              // Handle your onTap here
            },
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(icons[index], size: 40.0), // Icon
                  Text(titles[index]), // Text
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
