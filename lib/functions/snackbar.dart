// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:adguard_home_manager/providers/app_config_provider.dart';
import 'package:adguard_home_manager/config/globals.dart';

void showSnackbar({
  required AppConfigProvider appConfigProvider,
  required String label, 
  required Color color,
  Color? labelColor,
  GlobalKey<ScaffoldMessengerState>? key,
}) async {
  final GlobalKey<ScaffoldMessengerState> scaffoldKey = key ?? scaffoldMessengerKey;
  if (appConfigProvider.showingSnackbar == true) {
    scaffoldKey.currentState?.clearSnackBars();
    await Future.delayed(const Duration(milliseconds: 500));
  }
  appConfigProvider.setShowingSnackbar(true);

  final snackBar = SnackBar(
    content: Text(
      label,
      style: TextStyle(
        color: labelColor ?? Colors.white
      ),
    ),
    backgroundColor: color,
  );
  scaffoldKey.currentState?.showSnackBar(snackBar).closed.then(
    (value) => appConfigProvider.setShowingSnackbar(false)
  ); 
}