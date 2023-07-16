import 'package:flutter/material.dart';

import '../../router.dart';

class AlertDialog1 extends StatelessWidget {
  const AlertDialog1({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Alert"),
      content: const Text('test'),
      actions: [
        ElevatedButton(
            onPressed: () {
              appRoute.pop();
            },
            child: const Text("Ok"))
      ],
    );
  }
}
