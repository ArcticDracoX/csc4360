import 'dart:math';
import 'package:flutter/material.dart';


class Fish extends StatefulWidget
{
  final Color colour;
  final int speed;

  const Fish(
  {
    required this.colour,
    required this.speed,
    super.key,
  });

  @override
  State<Fish> createState() => _FishState();

  // @override
  Widget build(BuildContext context)
  {
    return SizedBox(
      width: 200,
      height: 200,
      child: Icon(Icons.circle, color: colour),
    );
  }
}

class _FishState extends State<Fish> with TickerProviderStateMixin
{
  late AnimationController _controller;
  bool isRight = true;
  @override
  void initState()
  {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: widget.speed),
      vsync: this
    );
    // Add your animation logic here.
  }

  @override
  void dispose()
  {
    _controller.dispose();
    super.dispose();
  }

  Future swim() async
  {
    if(_controller.isAnimating)
    {
      return;
    }

    if(isRight)
    {
      await _controller.forward();
    }
    else
    {
      await _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context)
  {
    double width = double.maxFinite;

    return AnimatedBuilder(
      animation: CurveTween(curve: Curves.easeInOutSine).animate(_controller),
      builder: (context, child)
      {
        return Positioned(child: widget);
      },
    );
  }
}

