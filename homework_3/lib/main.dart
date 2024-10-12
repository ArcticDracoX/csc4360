import 'package:flutter/material.dart';
import 'flippable_card.dart';
import 'game_logic.dart';

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
  List<FlippableCardController> controller =
  List.generate(6, (i) => FlippableCardController());
  
  static final List<Image> cardlist =
  [
    Image(image: AssetImage('assets/images/king_of_diamonds2.png')),
    Image(image: AssetImage('assets/images/queen_of_hearts2.png')),
    Image(image: AssetImage('assets/images/jack_of_clubs2.png')),
    // Excluded ace of spades due to lack of space for cards on device
    // Image(image: AssetImage('assets/images/ace_of_spades2.png')),
  ];

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
                      GameLogic().revealCard(controller, 0, 0);
                    },
                      child: SizedBox(
                        height: 762/3,
                        width: 500/3,
                        child: FlippableCard(
                        controller: controller[0],
                        front: Image(image: AssetImage('assets/images/card_back.png')),
                        back: cardlist[0],
                      ),
                      ),
                    ),
                  
                  SizedBox(width: 15),

                  GestureDetector(
                    onTap: ()
                    {
                      GameLogic().revealCard(controller, 1, 2);
                    },
                      child: SizedBox(
                        height: 762/3,
                        width: 500/3,
                        child: FlippableCard(
                        controller: controller[1],
                        front: Image(image: AssetImage('assets/images/card_back.png')),
                        back: cardlist[2],
                      ),
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
                      GameLogic().revealCard(controller, 2, 1);
                    },
                      child: SizedBox(
                        height: 762/3,
                        width: 500/3,
                        child: FlippableCard(
                        controller: controller[2],
                        front: Image(image: AssetImage('assets/images/card_back.png')),
                        back: cardlist[1],
                      ),
                      ),
                    ),

                  SizedBox(width: 15),

                  GestureDetector(
                    onTap: ()
                    {
                      GameLogic().revealCard(controller, 3, 0);
                    },
                      child: SizedBox(
                        height: 762/3,
                        width: 500/3,
                        child: FlippableCard(
                        controller: controller[3],
                        front: Image(image: AssetImage('assets/images/card_back.png')),
                        back: cardlist[0],
                      ),
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
                      GameLogic().revealCard(controller, 4, 1);
                    },
                      child: SizedBox(
                        height: 762/3,
                        width: 500/3,
                        child: FlippableCard(
                        controller: controller[4],
                        front: Image(image: AssetImage('assets/images/card_back.png')),
                        back: cardlist[1],
                      ),
                      ),
                    ),

                  SizedBox(width: 15),

                  GestureDetector(
                    onTap: ()
                    {
                      GameLogic().revealCard(controller, 5, 2);
                    },
                      child: SizedBox(
                        height: 762/3,
                        width: 500/3,
                        child: FlippableCard(
                        controller: controller[5],
                        front: Image(image: AssetImage('assets/images/card_back.png')),
                        back: cardlist[2],
                      ),
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
