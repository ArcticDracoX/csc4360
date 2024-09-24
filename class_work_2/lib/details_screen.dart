import 'package:flutter/material.dart';

class Recipe
{
  static String title = "";
  static List<String> ingredients = "" as List<String>;
  static List<String> instructions = "" as List<String>;

  Recipe
  (
    {
      required title,
      required ingredients,
      required instructions,
    }
  );
  
  String getTitle()
  {
    return title;
  }
}

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Recipe.title),
      ),
      body: Center(
        child: Text("Test")
      ),
    );
  }
}