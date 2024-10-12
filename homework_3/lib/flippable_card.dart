// Created using help of https://www.youtube.com/watch?v=X-yfuK5ix5U
// Literally would have no idea what to do otherwise
// Don't fully understand how it all works though
// APPARENTLY THE SOURCE CODE WAS AVAILABLE FOR DOWNLOAD AAAAAAAA

import 'dart:math';
import 'package:flutter/material.dart';

class FlippableCardController
{
  FlippableCardState? _state;
  Future flipCard() async => _state?.flipCard();
}

class FlippableCard extends StatefulWidget
{
  final FlippableCardController controller;
  final Image front;
  final Image back;

  const FlippableCard(
  {
    required this.controller,
    required this.front,
    required this.back,
    super.key,
  });

  @override
  FlippableCardState createState() => FlippableCardState();
}

class FlippableCardState extends State<FlippableCard> with TickerProviderStateMixin
{
  late AnimationController controller;
  bool isFront = true;
  
  @override
  void initState()
  {
    super.initState();

    // Load card images directly into cache
    WidgetsBinding.instance.addPostFrameCallback((_)
    {
        precacheImage(widget.front.image, context);
        precacheImage(widget.back.image, context);
    });

    controller = AnimationController
    (
      duration: const Duration(milliseconds: 500),
      vsync: this
    );

    widget.controller._state = this;
  }

  @override
  void dispose()
  {
    controller.dispose();
    super.dispose();
  }

  Future flipCard() async
  {
    isFront = !isFront;

    // Required animation to complete first
    if(controller.isAnimating)
    {
      return;
    }

    // Allows for card to flip both sides
    if(isFront)
    {
      await controller.reverse();
    }
    else
    {
    await controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(animation: controller, builder: (context, child)
  {
    final angle = -(controller.value * pi);
    final transform = Matrix4.identity()
    ..setEntry(3, 2, 0.001)
    ..rotateY(angle);
    
    return Transform(
      transform: transform,
      alignment: Alignment.center,
      child: isFrontImage(angle.abs())? widget.front : Transform(
        transform: Matrix4.identity()..rotateY(pi),
        alignment: Alignment.center,
        child: widget.back,
      ),
    );
  });

  // Show back image when angle degree is 90 < angle < 270 
  bool isFrontImage(double angle)
  {
    final degrees90 = pi/ 2;
    final degrees270 = (3 * pi) / 2;

    return angle <= degrees90 || angle >= degrees270;
  }
}