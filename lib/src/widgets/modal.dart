import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Modal extends StatelessWidget {
  const Modal({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpinKitCubeGrid(
      color: Colors.blue,
      size: 50.0,
    );
  }
}
