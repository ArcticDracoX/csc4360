import 'package:flutter/material.dart';
import 'details_screen.dart';

void main()
{
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget
{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Recipe List Home Screen'),
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
  final List<Recipe> recipelist = 
  [
    Recipe
    (
      title: "Recipe Template",
      
      ingredients:
      [
        "Ingredient Line 1",
        "Ingredient Line 2",
        "Ingredient Line 3",
        "Ingredient Line 4",
        "Ingredient Line 5",
      ],
      
      instructions:
      [
        "Instruction Line 1",
        "Instruction Line 2",
        "Instruction Line 3",
        "Instruction Line 4",
        "Instruction Line 5",
      ],
    ),

    Recipe
    (
      title: "Carbonara",
      
      ingredients:
      [
        "8 ounces of spaghetti",
        "2 eggs, large",
        "1 cup Pecorino Romano cheese, grated",
        "4 ounces of pancetta",
        "2 cloves of garlic",
        "Salt and black pepper",
        ],
      
      instructions:
      [
        "Cook the spaghetti in a large pot of salted boiling water until al dente.",
        "Whisk together the eggs, grated cheese, and black pepper in a bowl while the pasta is cooking.",
        "In a skillet, cook the pancetta until crispy, then add minced garlic.",
        "Reserve some pasta water, then drain the pasta and add it to the skillet.",
        "Pour the egg and cheese mixture over the pasta, tossing quickly to combine.",
        "If needed, add a splash of reserved pasta water to create a creamy sauce.",
        "Serve immediately with additional grated cheese and chopped parsley.",
      ]
    ),

    Recipe
    (
      title: "Pancakes",
      
      ingredients:
      [
        "1 cup all-purpose flour",
        "2 tablespoons sugar",
        "1 tablespoon baking powder",
        "1/2 teaspoon salt",
        "1 cup milk",
        "1 large egg",
        "2 tablespoons melted butter",
      ],
      
      instructions:
      [
        "In a large bowl, whisk together the flour, sugar, baking powder, and salt.",
        "In another bowl, whisk together the milk, egg, and melted butter.",
        "Pour the wet ingredients into the dry ingredients and mix until just combined.",
        "Heat a nonstick skillet or griddle over medium heat.",
        "Pour 1/4 cup of batter onto the skillet for each pancake.",
        "Cook until bubbles form on the surface, then flip and cook until golden brown.",
        "Serve with toppings of choice.",
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe List'),
      ),
      body: Center(
        child: Column
        (
          children:
          [
            TextButton
            (
              onPressed: ()
              {
                Navigator.push
                (
                  context,
                  MaterialPageRoute(builder: (context) => DetailsScreen(recipe: recipelist[0],)),
                );
              },
              child:
                Text(recipelist[0].title),
            ),

            TextButton
            (
              onPressed: ()
              {
                Navigator.push
                (
                  context,
                  MaterialPageRoute(builder: (context) => DetailsScreen(recipe: recipelist[1])),
                );
              },
              child:
                Text(recipelist[1].title),
            ),

            TextButton
            (
              onPressed: ()
              {
                Navigator.push
                (
                  context,
                  MaterialPageRoute(builder: (context) => DetailsScreen(recipe: recipelist[2])),
                );
              },
              child:
                Text(recipelist[2].title),
            ),
          ],
        )
      ),
    );
  }
}

