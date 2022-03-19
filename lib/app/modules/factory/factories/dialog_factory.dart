import 'dart:io';

import 'package:design_patterns/app/modules/factory/factories/android_dialog.dart';
import 'package:design_patterns/app/modules/factory/factories/dialog_action.dart';
import 'package:design_patterns/app/modules/factory/factories/i_dialog.dart';
import 'package:design_patterns/app/modules/factory/factories/ios_dialog.dart';
import 'package:flutter/material.dart';

class DialogFactory {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<T?> showAlertDialog<T>({
    Widget? title,
    Widget? content,
    List<DialogAction>? actions,
    bool forceAndroid = false,
    bool forceIos = false,
  }) {
    IDialog dialogData;

    if ((Platform.isIOS || forceIos) && !forceAndroid) {
      dialogData = IosDialog();
    } else if ((Platform.isAndroid || forceAndroid) && !forceAndroid) {
      dialogData = AndroidDialog();
    } else {
      dialogData = AndroidDialog();
    }

    return showDialog<T>(
      context: navigatorKey.currentState!.overlay!.context,
      builder: (context) => dialogData.create(
        context,
        title ?? const Text('Não informado'),
        content ?? const Text('Não informado'),
        actions ?? [],
      ),
    );
  }
}
