import 'package:flutter/material.dart';

import '../../models/challenge_widget.dart';
import '../../models/property_editors/property_editor.dart';

class EditDialog extends StatefulWidget {
  final ChallengeWidget widget;
  final void Function() doUpdateParent;

  const EditDialog(
      {Key key, @required this.widget, @required this.doUpdateParent})
      : super(key: key);

  @override
  _EditDialogState createState() => _EditDialogState(widget, doUpdateParent);
}

class _EditDialogState extends State<EditDialog> {
  final ChallengeWidget challengeWidget;
  final void Function() doUpdateParent;

  Map<String, bool> errors = {};
  Map<String, dynamic> values = {};
  Map<String, TextEditingController> controllers = {};

  _EditDialogState(this.challengeWidget, this.doUpdateParent) {
    challengeWidget.listEditableProperties().forEach((entry) {
      PropertyEditor editor = propertyEditors[entry.value.type];
      values[entry.key] = entry.value.value;
      controllers[entry.key] = TextEditingController(
        text: entry.value?.getAsString()
      )..addListener(() {
        String value = controllers[entry.key].value.text;
        if (editor.validate(value)) {
          voidError(entry.key);
          values[entry.key] = editor.convert(value);
        } else {
          setError(entry.key);
        }
      });
    });
  }

  void voidError(String key) {
    setState(() => errors.remove(key));
  }

  void setError(String key) {
    setState(() => errors[key] = true);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text('Properties'),
        content: Column(
            children: challengeWidget.listEditableProperties().map((entry) {
          InputBorder border = errors.containsKey(entry.key)
              ? OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.red, width: 2.0),
                )
              : null;
          return TextField(
              controller: controllers[entry.key],
              decoration: InputDecoration(
                labelText: entry.key,
                enabledBorder: border,
                focusedBorder: border,
                errorBorder: border,
                focusedErrorBorder: border,
                border: border,
              ),
            );
        }).toList()),
        actions: [
          FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          FlatButton(
              child: Text('Ok'),
              onPressed: () {
                challengeWidget.listEditableProperties().forEach((entry) {
                  challengeWidget.setPropertyValue(
                      entry.key, values[entry.key]);
                });
                doUpdateParent();
                Navigator.of(context).pop();
              }),
        ]);
  }
}
