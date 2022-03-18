import 'package:design_patterns/modules/factory/factories/dialog_action.dart';
import 'package:design_patterns/modules/factory/factories/i_dialog.dart';
import 'package:flutter/material.dart';

class AndroidDialog implements IDialog {
  @override
  Widget create(
    BuildContext context,
    Widget title,
    Widget content,
    List<DialogAction> actions,
  ) {
    return AlertDialog(
      title: title,
      content: content,
      actions: actions.map((a) {
        return FlatButton(
          child: a.child,
          onPressed: a.onPressed,
        );
      }).toList(),
    );
  }
}
