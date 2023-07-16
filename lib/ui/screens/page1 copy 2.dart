import 'dart:math';

import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation? _animations;
  bool toggle = true;

  Alignment alignment1 = const Alignment(0.0, 0.0);
  Alignment alignment2 = const Alignment(0.0, 0.0);
  Alignment alignment3 = const Alignment(0.0, 0.0);
  double size1 = 50.0;
  double size2 = 50.0;
  double size3 = 50.0;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 375));
    _animations = CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeIn);

    _controller!.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 250,
          width: 250,
          child: Stack(children: [
            secondButton(alignment1, size1),
            secondButton(alignment2, size2),
            secondButton(alignment3, size3),
            Align(
              alignment: Alignment.center,
              child: Transform.rotate(
                angle: _animations!.value * pi * (3 / 4),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 375),
                  curve: Curves.easeOut,
                  height: toggle ? 70 : 60,
                  width: toggle ? 70 : 60,
                  decoration: BoxDecoration(
                    color: Colors.yellow[600],
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: IconButton(
                        splashColor: Colors.black54,
                        splashRadius: 31,
                        onPressed: () {
                          setState(() {
                            if (toggle) {
                              toggle = !toggle;
                              _controller!.forward();
                              Future.delayed(const Duration(milliseconds: 10),
                                  () {
                                alignment1 = const Alignment(-0.7, -0.4);
                                alignment2 = const Alignment(-0.0, -0.8);
                                alignment3 = const Alignment(0.7, -0.4);
                              });
                            } else {
                              toggle = !toggle;
                              _controller!.reverse();
                              alignment1 = const Alignment(0.0, 0.0);
                              alignment2 = const Alignment(0.0, 0.0);
                              alignment3 = const Alignment(0.0, 0.0);
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 34,
                        )),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  AnimatedAlign secondButton(Alignment aligment, double size) {
    return AnimatedAlign(
      duration: toggle
          ? const Duration(milliseconds: 275)
          : const Duration(milliseconds: 875),
      alignment: aligment,
      curve: toggle ? Curves.easeIn : Curves.elasticInOut,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 270),
        curve: toggle ? Curves.easeIn : Curves.elasticInOut,
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(60),
        ),
        child: const Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
    );
  }
}
