import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart';

void main()
{
  setupWindow();
  runApp(
  // Provide the model to all widgets within the app. We're using
  // ChangeNotifierProvider because that's a simple way to rebuild
  // widgets when a model changes. We could also just use
  // Provider, but then we would have to listen to Counter ourselves.
  //
  // Read Provider's docs to learn about all the available providers.
    ChangeNotifierProvider(
    // Initialize the model in the builder. That way, Provider
    // can own Counter's lifecycle, making sure to call `dispose`
    // when not needed anymore.
      create: (context) => Counter(),
      child: const MyApp(),
    ),
  );
}

const double windowWidth = 360;
const double windowHeight = 640;
void setupWindow()
{
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS))
  {
    WidgetsFlutterBinding.ensureInitialized();
    setWindowTitle('Provider Counter');
    setWindowMinSize(const Size(windowWidth, windowHeight));
    setWindowMaxSize(const Size(windowWidth, windowHeight));
    getCurrentScreen().then((screen) {
    setWindowFrame(Rect.fromCenter(
      center: screen!.frame.center,
      width: windowWidth,
      height: windowHeight,
    ));
    });
  }
}

/// Simplest possible model, with just one field.
///
/// [ChangeNotifier] is a class in `flutter:foundation`. [Counter] does
/// _not_ depend on Provider.
class Counter with ChangeNotifier
{
  int value = 0;
  void increment()
  {
    value += 1;
    notifyListeners();
  }
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
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

Color getColour(int value)
{
  if(value <= 12)
  {
    return Colors.lightBlue;
  }
  else if(value <= 19)
  {
    return Colors.lightGreen;
  }
  else if(value <= 30)
  {
    return Colors.yellow;
  }
  else if(value <= 50)
  {
    return Colors.orange;
  }
  else
  {
    return Colors.grey;
  }
}

String ageMilestone(int value)
{
  if(value <= 12)
  {
    return "You're a child!";
  }
  else if(value <= 19)
  {
    return "Teenager time!";
  }
  else if(value <= 30)
  {
    return "You're a young adult now!";
  }
  else if(value <= 50)
  {
    return "You're an adult now!";
  }
  else
  {
    return "Golden years!";
  }
}

class MyHomePage extends StatelessWidget
{
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: getColour(context.watch<Counter>().value),
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(ageMilestone(context.watch<Counter>().value)),
            // Consumer looks for an ancestor Provider widget
            // and retrieves its model (Counter, in this case).
            // Then it uses that model to build widgets, and will trigger
            // rebuilds if the model is updated.
            Consumer<Counter>(
              builder: (context, counter, child) => Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          // You can access your providers anywhere you have access
          // to the context. One way is to use Provider.of<Counter>(context).
          // The provider package also defines extension methods on the context
          // itself. You can call context.watch<Counter>() in a build method
          // of any widget to access the current state of Counter, and to ask
          // Flutter to rebuild your widget anytime Counter changes.
          //
          // You can't use context.watch() outside build methods, because that
          // often leads to subtle bugs. Instead, you should use
          // context.read<Counter>(), which gets the current state
          // but doesn't ask Flutter for future rebuilds.
          //
          // Since we're in a callback that will be called whenever the user
          // taps the FloatingActionButton, we are not in the build method here.
          // We should use context.read().
          var counter = context.read<Counter>();
          counter.increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}