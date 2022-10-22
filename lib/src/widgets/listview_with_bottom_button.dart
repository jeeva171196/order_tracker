import 'package:flutter/material.dart';

class ListWithBottomButton extends StatelessWidget {
  const ListWithBottomButton(
      {super.key,
      required this.listViewItems,
      required this.bottomButton,
      this.buttonPadding = 3});
  final List<Widget> listViewItems;
  final Widget bottomButton;
  final double buttonPadding;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
        child: ListView(shrinkWrap: true, children: listViewItems),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: EdgeInsets.all(buttonPadding), child: bottomButton),
      )
    ]);
  }
}
