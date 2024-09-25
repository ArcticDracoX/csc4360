import 'package:flutter/material.dart';

class Recipe
{
  String title = "";
  List<String> ingredients = [];
  List<String> instructions = [];

  Recipe
  (
    {
      required this.title,
      required this.ingredients,
      required this.instructions,
    }
  );
}

class DetailsScreen extends StatelessWidget {
  final Recipe recipe;
  DetailsScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
      ),
      body: Center(
        child:Column
        (
          children:
          [
            Text("Ingredients"),
            Padding
            (
              padding:
                EdgeInsets.all(15),
              child:
              Text(recipe.ingredients.join("\n")),
            ),

            Text("Instructions"),
            Padding
            (
              padding:
                EdgeInsets.all(15),
              child: 
                Text(recipe.instructions.join("\n")),
            ),
          ],
        )
      ),
    );
  }
}