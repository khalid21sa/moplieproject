import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class Helper{
  static Future<void> sendEmail(
      String emailAddress, String subject, String body, BuildContext context
      ) async {
    if (Platform.isAndroid){
      AndroidIntent intent = AndroidIntent(
        action: 'android.intent.action.SEND',
        type: 'message/rfc822',
        arguments: {
          'android.intent.extra.EMAIL': [emailAddress],
          'android.intent.extra.SUBJECT': subject,
          'android.intent.extra.TEXT': body,
        },
      );

      try{
        await intent.launch();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Failed to send email. Please check your device's capabilities."),
            backgroundColor: Colors.amber,
          ),
        );
      }
    } else{
      String encodeSubject = Uri.encodeComponent(subject);
      String encodeBody = Uri.encodeComponent(body);
      String emailUrl = "mailto: $emailAddress? subject= $encodeSubject &body= $encodeBody";

      if (await canLaunch(emailUrl)) {
        await launch(emailUrl);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Failed to send email. Please check your device's capabilities."),
            backgroundColor: Colors.amber,
          ),
        );
      }
    }
  }
}