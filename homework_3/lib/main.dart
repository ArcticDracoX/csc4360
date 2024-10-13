import 'dart:io';
import 'package:flutter/material.dart';
import 'flippable_card.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Card Matching Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
      //   useMaterial3: true,
      // ),
      home: const MyHomePage(title: 'Card Matching Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget
{
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
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

  List<FlippableCard> compare = List.empty();
  List<bool> flipped = [false, false, false, false, false, false];
  
  void revealCard(FlippableCard currentcard)
  {
    // Check if the current card has been flipped
    if(!flipped[cardlist.indexOf(currentcard)])
    {
      // If there was not a card flipped before the current card, register it as the last card flipped
      if(compare.isEmpty)
      {
        compare = [currentcard];
        flipped[cardlist.indexOf(currentcard)] = true;
        compare[0].controller.flipCard();
      }

      // If the current card is not the same as the previous card, flip the current card.
      else if(currentcard != compare[0])
      {
        compare = [compare[0], currentcard];
        flipped[cardlist.indexOf(currentcard)] = true;
        compare[1].controller.flipCard().whenComplete(()
        {
          // And the faces match
          if(compare[1].back == compare[0].back)
          {
            // Forget the last card and increment match
           compare = List.empty();

            // Commence victory if all matches are found
            if(!flipped.contains(false))
            {

            }
          }

          // And the faces don't match
          else
          {
            // Unflip both cards after two seconds
            // sleep(Duration(seconds: 2));
            flipped[cardlist.indexOf(compare[0])] = false;
            flipped[cardlist.indexOf(compare[1])] = false;
            compare[0].controller.flipCard();
            compare[1].controller.flipCard();
            compare = List.empty();
          }
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade700,
        title: Text(widget.title, style: TextStyle(color: Colors.white,)),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          color: Colors.green.shade900,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>
            [
              const Text(
                'Match the cards to win!',
                style: TextStyle(color: Colors.white, fontSize: 24.0),
                textAlign: TextAlign.center,
              ),
              
              // Row 1
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  GestureDetector(
                    onTap: ()
                    {
                      setState(()
                      {
                        revealCard(cardlist[0]);
                      });
                    },
                    child: SizedBox(
                      height: 762/3,
                      width: 500/3,
                      child: cardlist[0],
                    ),
                  ),
                  
                  SizedBox(width: 15),

                  GestureDetector(
                    onTap: ()
                    {
                      setState(()
                      {
                        revealCard(cardlist[4]);
                      });
                    },
                    child: SizedBox(
                      height: 762/3,
                      width: 500/3,
                      child: cardlist[4],
                    ),
                  ),
                ],
              ),

              // Row 2
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  GestureDetector(
                    onTap: ()
                    {
                      setState(()
                      {
                        revealCard(cardlist[2]);
                      });
                    },
                    child: SizedBox(
                      height: 762/3,
                      width: 500/3,
                      child: cardlist[2],
                    ),
                  ),

                  SizedBox(width: 15),

                  GestureDetector(
                    onTap: ()
                    {
                      setState(()
                      {
                        revealCard(cardlist[5]);
                      }); 
                    },
                    child: SizedBox(
                      height: 762/3,
                      width: 500/3,
                      child: cardlist[5],
                    ),
                  ),
                ],
              ),
              
              // Row 3
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  GestureDetector(
                    onTap: ()
                    {
                      setState(()
                      {
                        revealCard(cardlist[3]);
                      });
                    },
                    child: SizedBox(
                      height: 762/3,
                      width: 500/3,
                      child: cardlist[3],
                    ),
                  ),

                  SizedBox(width: 15),

                  GestureDetector(
                    onTap: ()
                    {
                      setState(()
                      {
                        revealCard(cardlist[1]);
                      });
                    },
                    child: SizedBox(
                      height: 762/3,
                      width: 500/3,
                      child: cardlist[1],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
