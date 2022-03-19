import 'package:design_patterns/app/modules/factory/factories/dialog_action.dart';
import 'package:design_patterns/app/modules/factory/factories/i_dialog.dart';
import 'package:flutter/cupertino.dart';

class IosDialog implements IDialog {
  @override
  Widget create(
    BuildContext context,
    Widget title,
    Widget content,
    List<DialogAction> actions,
  ) {
    return CupertinoAlertDialog(
      title: title,
      content: content,
      actions: actions.map<Widget>((a) {
        return CupertinoButton(
          child: a.child,
          onPressed: a.onPressed,
        );
      }).toList(),
    );
  }
}
