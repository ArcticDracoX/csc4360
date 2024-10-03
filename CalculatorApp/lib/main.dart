import 'package:flutter/material.dart';

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
      title: 'Calculator Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculator Demo Home Page'),
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
  String current = "";
  List<String> queue = [];

  String printQueue()
  {
    int i = 0;
    String output = "";
    while(i < queue.length)
    {
      setState(()
      {
        output = "$output ${queue[i]} ";
      });
      i++;
    }
    return output;
  }

  void editCurrent(String value)
  {
    setState(()
    {
      current = "$current$value";
    });
  }

  void addOperator(String operator)
  {
    setState(()
    {
      if(current != "" && current != "-")
      {
        queue.add(current);
        current = "";
        queue.add(operator);
      }
    });
  }

  // void solveEquation()
  // {
  //   setState(()
  //   {
  //     
  //   });
  // }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              printQueue(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              current,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              children: [
                FilledButton(onPressed: ()
                {
                  editCurrent("7");
                },
                child: const Text("7")),

                FilledButton(onPressed: ()
                {
                  editCurrent("8");
                },
                child: const Text("8")),

                FilledButton(onPressed: ()
                {
                  editCurrent("9");
                },
                child: const Text("9")),

                FilledButton(onPressed: ()
                {
                  addOperator("+");
                },
                child: const Text("+")),
              ],
            ),

            Row(
              children: [
                FilledButton(onPressed: ()
                {
                  editCurrent("4");
                },
                child: const Text("4")),


                FilledButton(onPressed: ()
                {
                  editCurrent("5");
                },
                child: const Text("5")),

                FilledButton(onPressed: ()
                {
                  editCurrent("6");
                },
                child: const Text("6")),

                FilledButton(onPressed: ()
                {
                  addOperator("-");
                },
                child: const Text("-")),
              ],
            ),

            Row(
              children: [
                FilledButton(onPressed: ()
                {
                  editCurrent("1");
                },
                child: const Text("1")),

                FilledButton(onPressed: ()
                {
                  editCurrent("2");
                },
                child: const Text("2")),

                FilledButton(onPressed: ()
                {
                  editCurrent("3");
                },
                child: const Text("3")),

                FilledButton(onPressed: ()
                {
                  addOperator("*");
                },
                child: const Text("*")),
              ],
            ),

            Row(
              children: [
                FilledButton(onPressed: ()
                {
                  if(!current.startsWith("-"))
                  {
                    setState(()
                    {
                      current = "-$current";
                    });
                  }
                  else
                  {
                    setState(()
                    {
                      current = current.substring(1);
                    });
                  }
                },
                child: const Text("+/-")),

                FilledButton(onPressed: ()
                {
                  editCurrent("0");
                },
                child: const Text("0")),

                FilledButton(onPressed: ()
                {
                  setState(()
                  {
                    if(current != "")
                    {
                      current = "";
                    }
                    else
                    {
                      queue = [];
                    }
                  });
                  
                },
                child: const Text("C")),

                // FilledButton(onPressed: ()
                // {
                //   editCurrent(".");
                // },
                // child: const Text(".")),
                

                

                FilledButton(onPressed: ()
                {
                  addOperator("/");
                },
                child: const Text("/")),
              ],
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      // onPressed: solveEquation,
      // tooltip: 'Equal',
      // child: const Text("="),
      // ),
    );
  }
}
