import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CheckboxListDialog extends StatefulWidget {
  const CheckboxListDialog(
      {super.key,
      required this.title,
      required this.values,
      required this.onChanged});

  final String title;
  final Map<int, bool> values;
  final void Function(Map<int, bool>) onChanged;

  @override
  State<CheckboxListDialog> createState() => _CheckboxListDialogState();
}

class _CheckboxListDialogState extends State<CheckboxListDialog> {
  Map<int, bool> options = {};

  @override
  initState() {
    setState(() {
      options = widget.values;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Container(
        height: 500.0,
        width: 300.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                widget.title,
                style: TextStyle(color: Colors.red),
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                      height: 30,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Checkbox(
                                    value: options[index + 1],
                                    onChanged: ((value) {
                                      setState(() {
                                        options[index + 1] = value!;
                                      });
                                    })),
                                Text("${widget.title} ${index + 1}"),
                              ]),
                        ), //BoxDecoration
                      ));
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            TextButton(
                onPressed: () {
                  widget.onChanged(options);
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Done',
                  style: TextStyle(color: Colors.purple, fontSize: 18.0),
                ))
          ],
        ),
      ),
    );
  }
}
// showDialog(context: context, builder: (BuildContext context) => errorDialog);}