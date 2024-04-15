import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_animate/flutter_animate.dart';

///sun container

class Sun extends StatefulWidget {
  const Sun({
    super.key,
  });

  @override
  State<Sun> createState() => _SunState();
}

class _SunState extends State<Sun> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward()
          ..repeat(reverse: true);

    _animation = Tween<double>(begin: 30, end: 100).animate(_controller);

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SafeArea(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow,
                boxShadow: [
                  BoxShadow(
                    color: Colors.yellow[800]!,
                    blurRadius: _animation.value,
                    spreadRadius: 20,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              width: 100,
              height: 100,
            ),
          );
        });
  }
}

///moon container
///
///

class CrescentMoonContainer extends StatelessWidget {
  final Color color;

  CrescentMoonContainer({required this.color});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 100,
        width: 100,
        child: Transform.rotate(
            angle: math.pi / -5,
            child: Icon(
              Icons.nightlight_round_outlined,
              color: color,
              size: 100,
              shadows: [
                BoxShadow(
                  color: const Color.fromARGB(255, 255, 255, 255)!,
                  blurRadius: 20,
                  spreadRadius: 20,
                  offset: const Offset(0, 0),
                ),
              ],
            )),
      ),
    );
  }
}

//Star Widget Class

class StarWidget extends StatelessWidget {
  const StarWidget({
    super.key,
    required AnimationController controller,
  }) : _controller = controller;

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Animate(
        controller: _controller,
        effects: Theme.of(context).brightness == Brightness.dark
            ? const [
                FadeEffect(begin: 0, end: 1.0),
                SlideEffect(
                    curve: Curves.easeOut,
                    begin: Offset(3, 0),
                    end: Offset(0, 0),
                    duration: Duration(seconds: 1)),
                SlideEffect(
                    curve: Curves.easeOutCirc,
                    begin: Offset(0, 3),
                    end: Offset(0, 0),
                    duration: Duration(seconds: 1))
              ]
            : const [
                FadeEffect(begin: 0, end: 1.0),
                SlideEffect(
                    curve: Curves.easeOut,
                    begin: Offset(-3, 0),
                    end: Offset(0, 0),
                    duration: Duration(seconds: 1)),
                SlideEffect(
                    curve: Curves.easeOutCirc,
                    begin: Offset(0, 3),
                    end: Offset(0, 0),
                    duration: Duration(seconds: 1))
              ],
        child: const Align(
            alignment: Alignment.topCenter,
            child:
                //container sun
                Sun()

            //
            ));
  }
}

//Cloud Widget Class

class CloudWidget extends StatelessWidget {
  const CloudWidget({
    super.key,
    required AnimationController controller2,
  }) : _controller2 = controller2;

  final AnimationController _controller2;

  @override
  Widget build(BuildContext context) {
    return Animate(
      // delay: const Duration(milliseconds: 3000),
      controller: _controller2,
      effects: const [
        SlideEffect(
          duration: Duration(milliseconds: 1000),
          begin: Offset(3, 0),
          end: Offset(0, 0),
        )
      ],
      child: const SizedBox(
        height: 150,
        width: double.maxFinite,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Icon(
                Icons.cloud,
                color: Color.fromARGB(255, 255, 255, 255),
                size: 55,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.cloud,
                color: Color.fromARGB(255, 255, 255, 255),
                size: 66,
              ),
            ),
            Align(
              alignment: Alignment(.34, 1.7),
              child: Icon(
                Icons.cloud,
                color: Color.fromARGB(255, 255, 255, 255),
                size: 70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Gradient Background Widget

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      crossFadeState: Theme.of(context).brightness == Brightness.dark
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: const Duration(seconds: 1),
      firstChild: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Color.fromARGB(255, 67, 29, 172),
            ],
          ),
        ),
      ),
      secondChild: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 241, 116, 0),
            ],
          ),
        ),
      ),
    );
  }
}
