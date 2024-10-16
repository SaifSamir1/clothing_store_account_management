

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> openAppsSettings() async {
  final openAppsSettings = await openAppSettings();
  log('App Settings opened: $openAppsSettings'); // For debugging (optional)
}

Future<bool> requestStoragePermission(context) async {
  final status = await Permission.storage.request();

  if (status.isGranted) {
    log('Storage permission granted');
    return true;
  } else if (status.isPermanentlyDenied || status.isDenied) {
    log('Storage permission permanently denied');
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Storage Permission Required'),
        content: const Text('This app needs storage access to [explain functionality]. '
            'Please go to Settings and grant permission.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => openAppsSettings(),
            child: const Text('Settings'),
          ),
        ],
      ),
    );
    return false;
  } else {
    log('Storage permission request status: $status');
    return false;
  }
}