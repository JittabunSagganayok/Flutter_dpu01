import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformAlert {
  final String title;
  final String message;

  PlatformAlert({required this.title, required this.message});

  void show(BuildContext context) {
    final platform = Theme.of(context).platform;
    if (platform == TargetPlatform.iOS) {
      _buildCupertinoDialog(context);
    } else {
      _buildMaterialDialog(context);
    }
  }

  void _buildCupertinoDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            CupertinoButton(
                child: Text("ok"),
                onPressed: () => Navigator.of(context).pop()),
          ],
        );
      },
    );
  }

  void _buildMaterialDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
                child: Text("ok"),
                onPressed: () => Navigator.of(context).pop()),
          ],
        );
      },
    );
  }
}
