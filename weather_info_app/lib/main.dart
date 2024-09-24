import 'package:flutter/material.dart';
import 'dart:math';

void main() {
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
  final myController = TextEditingController();
  String city = "";
  String temp = "";
  String weather = "";

  void getWeather(String name)
  {
    city = name;
    int i = Random().nextInt(3);
    
    setState(() {
      temp = ((Random().nextDouble() * 15) + 15).toStringAsFixed(2);
      if(i == 0)
      {
        weather = "Sunny";
      }
        if(i == 1)
      {
        weather = "Cloudy";
      }
        if(i == 2)
      {
        weather = "Rain";
      }
    });
  }

  @override
  void dispose()
  {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar
      (
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center
      (
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(controller: myController),
            
            ElevatedButton
            (
              onPressed: () => getWeather(myController.text),
              child: const Text("Fetch Weather")
            ),
            
            Text("City: $city"),
            Text("Temperature: $temp"),
            Text("Weather: $weather")
          ],
        ),
      ),
    );
  }
}
