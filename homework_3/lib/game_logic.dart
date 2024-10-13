import 'dart:io';
import 'package:flutter/material.dart';
import 'flippable_card.dart';

class GameLogic
{
  final List<FlippableCardController> controller =
  List.generate(6, (i) => FlippableCardController(), growable: false);

  final List<Image> cardface =
  [
    Image(image: AssetImage('assets/images/card_back.png')),
    Image(image: AssetImage('assets/images/king_of_diamonds2.png')),
    Image(image: AssetImage('assets/images/queen_of_hearts2.png')),
    Image(image: AssetImage('assets/images/jack_of_clubs2.png')),
    // Excluded ace of spades due to lack of space for cards on device
    // Image(image: AssetImage('assets/images/ace_of_spades2.png')),
  ];

  late final List<FlippableCard> cardlist =
  [
    FlippableCard(
      controller: controller[0],
      front: cardface[0],
      back: cardface[1],
    ),

    FlippableCard(
      controller: controller[1],
      front: cardface[0],
      back: cardface[1],
    ),

    FlippableCard(
      controller: controller[2],
      front: cardface[0],
      back: cardface[2],
    ),

    FlippableCard(
      controller: controller[3],
      front: cardface[0],
      back: cardface[2],
    ),

    FlippableCard(
      controller: controller[4],
      front: cardface[0],
      back: cardface[3],
    ),

    FlippableCard(
      controller: controller[5],
      front: cardface[0],
      back: cardface[3],
    ),
  ];
  
  void revealCard(FlippableCard currentcard, List<FlippableCard> compare, int match)
  {
    // If there was not a card flipped before the current card, register it as the last card flipped
    if(compare.isEmpty)
    {
      compare = [currentcard];
      compare[0].controller.flipCard();
    }
    
    // If the current card is not the same as the previous card, flip the current card.
    else if(currentcard != compare[0])
    {
      compare = [compare[0], currentcard];
      compare[1].controller.flipCard().whenComplete(()
      {
        // And the faces match
        if(compare[1].back == compare[0].back)
        {
          // Forget the last card and increment match
          compare = List.empty();
          match++;

          // Commence victory if all matches are found
          if(match == (cardlist.length / 2))
          {

          }
        }

        // And the faces don't match
        else
        {
          // Unflip both cards after two seconds
          sleep(Duration(seconds: 2));
          compare[0].controller.flipCard();
          compare[1].controller.flipCard();
          compare = List.empty();
        }
      });
    }
  }
}
