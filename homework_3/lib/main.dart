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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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
                      controller[0].flipCard();
                    },
                      child: SizedBox(
                        height: 762/3,
                        width: 500/3,
                        child: FlippableCard(
                        controller: controller[0],
                        front: Image(image: AssetImage('assets/images/card_back.png')),
                        back: Image(image: AssetImage('assets/images/ace_of_spades2.png')),
                      ),
                      ),
                    ),

                  GestureDetector(
                    onTap: ()
                    {
                      controller[1].flipCard();
                    },
                      child: SizedBox(
                        height: 762/3,
                        width: 500/3,
                        child: FlippableCard(
                        controller: controller[1],
                        front: Image(image: AssetImage('assets/images/card_back.png')),
                        back: Image(image: AssetImage('assets/images/ace_of_spades2.png')),
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
                      controller[2].flipCard();
                    },
                      child: SizedBox(
                        height: 762/3,
                        width: 500/3,
                        child: FlippableCard(
                        controller: controller[2],
                        front: Image(image: AssetImage('assets/images/card_back.png')),
                        back: Image(image: AssetImage('assets/images/ace_of_spades2.png')),
                      ),
                      ),
                    ),

                  GestureDetector(
                    onTap: ()
                    {
                      controller[3].flipCard();
                    },
                      child: SizedBox(
                        height: 762/3,
                        width: 500/3,
                        child: FlippableCard(
                        controller: controller[3],
                        front: Image(image: AssetImage('assets/images/card_back.png')),
                        back: Image(image: AssetImage('assets/images/ace_of_spades2.png')),
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
                      controller[4].flipCard();
                    },
                      child: SizedBox(
                        height: 762/3,
                        width: 500/3,
                        child: FlippableCard(
                        controller: controller[4],
                        front: Image(image: AssetImage('assets/images/card_back.png')),
                        back: Image(image: AssetImage('assets/images/ace_of_spades2.png')),
                      ),
                      ),
                    ),

                  GestureDetector(
                    onTap: ()
                    {
                      controller[5].flipCard();
                    },
                      child: SizedBox(
                        height: 762/3,
                        width: 500/3,
                        child: FlippableCard(
                        controller: controller[5],
                        front: Image(image: AssetImage('assets/images/card_back.png')),
                        back: Image(image: AssetImage('assets/images/ace_of_spades2.png')),
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
