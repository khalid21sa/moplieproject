import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Helper {
  static Future<void> sendSMS(
      String phoneNumber, String message, BuildContext context
      ) async {
    String smsUrl = "sms:$phoneNumber?body=$message";

    if (await canLaunch(smsUrl)){
      await launch(smsUrl);
    }else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Failed to send SMS. please check your mobile capabilities."),
        backgroundColor: Colors.amber,
      ),
      );
    }
  }
}