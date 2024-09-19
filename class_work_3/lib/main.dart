import 'package:flutter/material.dart';
import 'dart:async';

void main()
{
  runApp(MaterialApp(
    home: DigitalPetApp(),
  ));
}

class DigitalPetApp extends StatefulWidget
{
  @override
  _DigitalPetAppState createState() => _DigitalPetAppState();
}

class _DigitalPetAppState extends State<DigitalPetApp>
{
  String petName = "Your Pet";
  int happinessLevel = 50;
  int hungerLevel = 50;
  Timer? hungerTimer;
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    startHungerTimer();
  }

  @override
  void dispose() {
    hungerTimer?.cancel();
    super.dispose();
  }

  //hunger level
  void startHungerTimer() {
    hungerTimer = Timer.periodic(Duration(seconds: 30), (timer) {
      setState(() {
        hungerLevel = (hungerLevel + 5).clamp(0, 100);
        _updateHappiness();
      });
    });
  }
  
  // Function to increase happiness and update hunger when playing with the pet
  void _playWithPet()
  {
    setState(()
    {
      happinessLevel = (happinessLevel + 10).clamp(0, 100);
      _updateHunger();
    });
  }
  
  // Function to decrease hunger and update happiness when feeding the pet
  void _feedPet()
  {
    setState(()
    {
      hungerLevel = (hungerLevel - 10).clamp(0, 100);
      _updateHappiness();
    });
  }
  
  // Update happiness based on hunger level
  void _updateHappiness()
  {
    if (hungerLevel < 30) {
    happinessLevel = (happinessLevel - 20).clamp(0, 100);
    }
    else
    {
    happinessLevel = (happinessLevel + 10).clamp(0, 100);
    }
  }
  
  // Increase hunger level slightly when playing with the pet
  void _updateHunger()
  {
    hungerLevel = (hungerLevel + 5).clamp(0, 100);
    if (hungerLevel > 100)
    {
      hungerLevel = 100;
      happinessLevel = (happinessLevel - 20).clamp(0, 100);
    }
  }

  void _showGameOverDialog()
  {
    showDialog
    (
      context: context,
      builder: (BuildContext context)
      {
        return AlertDialog
        (
          title: Text("Game Over"),
          content: Text("Your pet is too hungry and unhappy!"),
          actions: [
            TextButton(
              child: Text("Restart"),
              onPressed: () {
                Navigator.of(context).pop();
                _restartGame();
              },
            ),
          ],
        );
      },
    );
  }

  void _restartGame()
  {
    setState(() {
      hungerLevel = 50;
      happinessLevel = 50;
    });
  }

  Color _getPetColor() {
    if (happinessLevel > 70)
    {
      return Colors.green;
    }

    else if (happinessLevel >= 30 && happinessLevel <= 70)
    {
      return Colors.yellow;
    } 

    else
    {
      return Colors.red;
    }
  }

  String _getMoodIndicator()
  {
    if (happinessLevel > 70)
    {
      return "😊 Happy";
    }
    
    else if (happinessLevel >= 30 && happinessLevel <= 70)
    {
      return "😐 Neutral";
    }
    
    else
    {
      return "😢 Unhappy";
    }
  }
  
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text('Digital Pet'),
      ),

      body: Center
      (
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Enter Pet Name",
              ),
            ),

            SizedBox(height: 16.0),

            Text
            (
              'Name: $petName',
              style: TextStyle(fontSize: 20.0),
            ),

            SizedBox(height: 16.0),

            ColorFiltered
            (
              colorFilter: ColorFilter.mode(_getPetColor(), BlendMode.color),
              child: 
              Image.network
              (
                "https://ffxivcollect.com/assets/mounts/large/326-93f4ba9c1525005bfdae28bf93a4229899513ab7021a43143f8839a97af304fc.png",
              )
            ),

            SizedBox(height: 16.0),
            
            Text(
              'Mood: ${_getMoodIndicator()}',
            ),

            SizedBox(height: 16.0),

            Text
            (
              'Happiness Level: $happinessLevel',
              style: TextStyle(fontSize: 20.0),
            ),

            SizedBox(height: 16.0),

            Text
            (
              'Hunger Level: $hungerLevel',
              style: TextStyle(fontSize: 20.0),
            ),

            SizedBox(height: 32.0),

            ElevatedButton
            (
              onPressed: _playWithPet,
              child: Text('Play with Your Pet'),
            ),

            SizedBox(height: 16.0),

            ElevatedButton
            (
              onPressed: _feedPet,
              child: Text('Feed Your Pet'),
            ),
          ],
        ),
      ),
    );
  }
}