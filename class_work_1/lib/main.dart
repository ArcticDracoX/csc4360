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
      title: 'CW 01 Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
      ),
      
      home: const MyHomePage(title: 'Counter & Image Toggle Demo'),
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

// Yes I know my spacings are inconsistent but I only messed with what I needed to from default main.dart
// Also trying to make it easier to see what starts and ends where for my own sake
class _MyHomePageState extends State<MyHomePage>
{
  // Counter and Toggle
  int counter = 0;
  bool imgtoggle = false;

  // Basic Increment Counter
  void incrementCounter()
  {
    setState(()
    {
      counter++;
    }
    );
  }

  // Basic True/False Toggle
  void toggleImage()
  {
    setState(()
    {
      if(imgtoggle == true)
      {
        imgtoggle = false;
      }
      else
      {
        imgtoggle = true; 
      }
    }
    );
  }

  void reset()
  {
    setState(()
    {
      counter = 0;
      imgtoggle = false;
    }
    );
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
          children: <Widget>
          [
            // Counter Tracker
            const Text
            (
              'You have pushed the button this many times:',
            ),
            Text
            (
              '$counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            // Gabriel α Image / Purple Image
            // Displays as initial image when imgtoggle == false
            // Disappears when imgtoggle == true
            Visibility
            (
              visible: !imgtoggle,
              child: Image.network("https://ffxivcollect.com/assets/mounts/large/224-7b9d0177cbab7f4b4518b53afa7d1268b3aa7f8686abe7f83252dc2a5dd9867e.png"),  
            ),

            // Gabriel Mk. III Image / Gold Image
            // Displays as toggled image when imgtoggle == true
            // Disappears when imgtoggle == false
            Visibility
            (
              visible: imgtoggle,
              child: Image.network("https://ffxivcollect.com/assets/mounts/large/241-22cc453ab39164f4b23fe7dd816da415476705a08950277df78e38de8bf8c3af.png"),
            ),

            // Image Toggle Button
            ElevatedButton
            (
              onPressed: toggleImage,
              child: const Text("Image Toggle")
            ),

            // Reset Button
            // Not a grad student but I wanted more practice w/ Flutter
            ElevatedButton
            (
              onPressed: reset,
              child: const Text("Reset")
            )
          ],
        ),
      ),

      // Counter Button
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        tooltip: 'Counter Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
