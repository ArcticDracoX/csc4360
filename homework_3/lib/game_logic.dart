import 'dart:io';
import 'flippable_card.dart';

class GameLogic extends FlippableCardController
{
  // Initialised outside of what revealCard can take
  // NEEDS FIXING: Changes from revealCard are not saving
  List<bool> cardFlipped = [false, false, false, false, false, false];
  int lastCard = -1;
  int lastFace = -1;

  void revealCard(List<FlippableCardController> controller, int currentCard, int currentFace)
  {
    // If the current card is facing down, flip the current card.
    if(!cardFlipped[currentCard])
    {
      controller[currentCard].flipCard();
      cardFlipped[currentCard] = true;
      
      // If there was a card flipped before the current card
      if(lastCard > -1)
      {
        // And the faces match
        if(currentFace == lastFace)
        {
          // Forget the last card and face before carrying forward
          lastCard = -1;
          lastFace = -1;
        }

        // And the faces don't match
        else
        {
          // Unflip both cards after three seconds
          sleep(Duration(seconds: 3));
          controller[currentCard].flipCard();
          controller[lastCard].flipCard();
          cardFlipped[currentCard] = false;
          cardFlipped[currentCard] = false;
        }
      }

      // If there was not a card flipped before the current card, register it as the last card flipped
      else
      {
        lastCard = currentCard;
        lastFace = currentFace;
      }
    }
  }

  void setLastCard(int value)
  {
    lastCard = value;
  }
}
