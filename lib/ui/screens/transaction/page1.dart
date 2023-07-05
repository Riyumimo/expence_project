import 'package:flutter/material.dart';

import '../../../router.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
          onPressed: () {
            appRoute.push('/page2');
          },
          child: Text('page 2')),
    ));
  }
}
