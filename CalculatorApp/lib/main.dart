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
  List<String> equation = [];

  String printEquation()
  {
    int i = 0;
    String output = "";
    while(i < equation.length)
    {
      setState(()
      {
        output = "$output ${equation[i]} ";
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

  void moveToEquation()
  {
    setState(()
    {
      if(current != "" && current != "-")
      {
        equation.add(current);
        current = "";
      }
    });
  }

  void addOperator(String operator)
  {
    setState(()
    {
      if(current != "-")
      {
        if(current != "")
        {
          if(equation.isEmpty)
          {
            moveToEquation();
            equation.add(operator);
          }
          else
          {
            if(equation.last == "+" || equation.last == "-" || equation.last == "*" || equation.last == "/")
            {
              moveToEquation();
              equation.add(operator);
            }
          }
        }
        else
        {
          if(!(equation.last == "+" || equation.last == "-" || equation.last == "*" || equation.last == "/"))
          {
            equation.add(operator);
          }
        }
      }
    });
  }

  void solveEquation()
  {
    int solver = 0;

    // If you try to divide by zero
    if(equation[equation.indexOf("/") + 1] == "0")
    {
      // And you're trying to divide zero by zero, return an error.
      if(equation[equation.indexOf("/") - 1] == "0")
      {
        equation = ["Error"];
      }
      // From any number other than zero, return infinity.
      else
      {
        equation = ["Infinity"];
      }
    }

    // If an error is present, continue reinforcing that there is an error that must be cleared
    if(equation.contains("Error"))
    {
      equation = ["Error"];
    }

    // If infinity is present, then the answer is infinity
    if(equation.contains("Infinity"))
    {
      equation = ["Infinity"];
    }

    // Only solve when there is more than one value
    while(equation.length > 1)
    {
      // If the function contains either multiplication or division,
      if(equation.contains("*") || equation.contains("/"))
      {
        // And it contains both,
        if(equation.contains("*") && equation.contains("/"))
        {
          // And multiplication is first, multiply.
          if(equation.indexOf("*") < equation.indexOf("/"))
          {
            solver = (int.parse(equation[equation.indexOf("*") - 1]) * int.parse(equation[equation.indexOf("*") + 1]));
            equation.replaceRange(equation.indexOf("*") - 1, equation.indexOf("*") + 2, [solver.toString()]);
          }
          // And it only contains division, divide.
          else
          {
            solver = int.parse(equation[equation.indexOf("/") - 1]) ~/ int.parse(equation[equation.indexOf("/") + 1]);
            equation.replaceRange(equation.indexOf("/") - 1, equation.indexOf("/") + 2, [solver.toString()]);
          }
        }

        // And it only contains multiplication, multiply.
        else if(equation.contains("*"))
        {
          solver = (int.parse(equation[equation.indexOf("*") - 1]) * int.parse(equation[equation.indexOf("*") + 1]));
          equation.replaceRange(equation.indexOf("*") - 1, equation.indexOf("*") + 2, [solver.toString()]);
        }
        // And only contains division, divide.
           else
          {
            solver = int.parse(equation[equation.indexOf("/") - 1]) ~/ int.parse(equation[equation.indexOf("/") + 1]);
            equation.replaceRange(equation.indexOf("/") - 1, equation.indexOf("/") + 2, [solver.toString()]);
          }
      }

      // If the function contains either addition or subtraction,
      else if(equation.contains("+") || equation.contains("-"))
      {
        // And it contains both,
        if(equation.contains("+") && equation.contains("-"))
        {
          // And addition is first, add.
          if(equation.indexOf("+") < equation.indexOf("-"))
          {
            solver = (int.parse(equation[equation.indexOf("+") - 1]) + int.parse(equation[equation.indexOf("+") + 1]));
            equation.replaceRange(equation.indexOf("+") - 1, equation.indexOf("+") + 2, [solver.toString()]);
          }
          // And subtraction is first, subtract.
          else
          {
            solver = (int.parse(equation[equation.indexOf("-") - 1]) - int.parse(equation[equation.indexOf("-") + 1]));
            equation.replaceRange(equation.indexOf("-") - 1, equation.indexOf("-") + 2, [solver.toString()]);
          }
        }

        // And it only contains addition, add.
        else if(equation.contains("+"))
        {
          solver = (int.parse(equation[equation.indexOf("+") - 1]) + int.parse(equation[equation.indexOf("+") + 1]));
          equation.replaceRange(equation.indexOf("+") - 1, equation.indexOf("+") + 2, [solver.toString()]);
        }
        
        // And it only contains subtraction, subtract.
        else if(equation.contains("-"))
        {
          solver = (int.parse(equation[equation.indexOf("-") - 1]) - int.parse(equation[equation.indexOf("-") + 1]));
          equation.replaceRange(equation.indexOf("-") - 1, equation.indexOf("-") + 2, [solver.toString()]);
        }
      }
    }
  }

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
              printEquation(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              current,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
              mainAxisAlignment: MainAxisAlignment.center,
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
              mainAxisAlignment: MainAxisAlignment.center,
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
              mainAxisAlignment: MainAxisAlignment.center,
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
                      equation = [];
                    }
                  });
                  
                },
                child: const Text("C")),

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
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          setState(()
          {
            // Moves the current editing value into the list
            if(equation.isEmpty)
            {
              moveToEquation();
            }
            if(equation.last == "+" || equation.last == "-" || equation.last == "*" || equation.last == "/")
            {
              moveToEquation();
            }
            
            // Only solves if there are an odd number of elements in the list
            // Ensures that every operator has two operands
            if((equation.length).isOdd)
            {
              solveEquation();
            }
          });
        },
        tooltip: 'Solve Equation',
        child: const Text("="),
        ),
    );
  }
}
