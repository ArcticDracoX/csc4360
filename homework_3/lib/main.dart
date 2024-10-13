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
  List<FlippableCard> compare = List.empty();
  int match = 0;
  
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
                        GameLogic().revealCard(GameLogic().cardlist[0], compare, match);
                      });
                    },
                    child: SizedBox(
                      height: 762/3,
                      width: 500/3,
                      child: GameLogic().cardlist[0],
                    ),
                  ),
                  
                  SizedBox(width: 15),

                  GestureDetector(
                    onTap: ()
                    {
                      setState(()
                      {
                        GameLogic().revealCard(GameLogic().cardlist[4], compare, match);
                      });
                    },
                    child: SizedBox(
                      height: 762/3,
                      width: 500/3,
                      child: GameLogic().cardlist[4],
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
                        GameLogic().revealCard(GameLogic().cardlist[2], compare, match);
                      });
                    },
                    child: SizedBox(
                      height: 762/3,
                      width: 500/3,
                      child: GameLogic().cardlist[2],
                    ),
                  ),

                  SizedBox(width: 15),

                  GestureDetector(
                    onTap: ()
                    {
                      setState(()
                      {
                        GameLogic().revealCard(GameLogic().cardlist[5], compare, match);
                      }); 
                    },
                    child: SizedBox(
                      height: 762/3,
                      width: 500/3,
                      child: GameLogic().cardlist[5],
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
                        GameLogic().revealCard(GameLogic().cardlist[3], compare, match);
                      });
                    },
                    child: SizedBox(
                      height: 762/3,
                      width: 500/3,
                      child: GameLogic().cardlist[3],
                    ),
                  ),

                  SizedBox(width: 15),

                  GestureDetector(
                    onTap: ()
                    {
                      setState(()
                      {
                        GameLogic().revealCard(GameLogic().cardlist[1], compare, match);
                      });
                    },
                    child: SizedBox(
                      height: 762/3,
                      width: 500/3,
                      child: GameLogic().cardlist[1],
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
