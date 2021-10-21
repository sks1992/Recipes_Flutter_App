import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:recipes/recipes.dart';
import 'package:recipes/recpie_detail.dart';

/*main() is the entry point for the code when the app launches. runApp() tells
Flutter which is the top-level widget for the app.*/
void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'Recipe Calculator',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.grey,
          secondary: Colors.black,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipe Calculator"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
          //itemBuilder builds the widget tree for each row.
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RecipeDetail(Recipe.recipes[index]);
                    },
                  ),
                );
              },
              child: buildRecipeCrd(
                (Recipe.recipes[index]),
              ),
            );
          },
          //itemCount determines the number of rows the list has
          itemCount: Recipe.recipes.length,
        ),
      ),
    );
  }

  Card buildRecipeCrd(Recipe recipe) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image(image: AssetImage(recipe.imageUrl)),
            const SizedBox(
              height: 14.0,
            ),
            Text(
              recipe.label,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palatino',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*

Step 1=>Display the list of recipes label

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipe Calculator"),
        centerTitle: true,
      ),
      body:  SafeArea(
        child: ListView.builder(itemBuilder: (BuildContext context,int index){
          return Text(Recipe.recipes[index].label);
        },itemCount: Recipe.recipes.length,),
      ),
    );
  }
}*/

/*
step2 => Build a card for recipe to show images and label

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipe Calculator"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
          //itemBuilder builds the widget tree for each row.
          itemBuilder: (BuildContext context, int index) {
            return buildRecipeCrd(index);
          },
          //itemCount determines the number of rows the list has
          itemCount: Recipe.recipes.length,
        ),
      ),
    );
  }

  Card buildRecipeCrd(int index) {
    return Card(
      child: Column(
        children: [
          Image(image: AssetImage(Recipe.recipes[index].imageUrl)),
          Text(Recipe.recipes[index].label)
        ],
      ),
    );
  }
}

* */

/*
Step 3:=> Adding decoration to ui
  Card buildRecipeCrd(Recipe recipe) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image(image: AssetImage(recipe.imageUrl)),
            const SizedBox(
              height: 14.0,
            ),
            Text(
              recipe.label,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palatino',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
* */

/*
Step 4 :=> add GestureDetector and navigation to detail page
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipe Calculator"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
          //itemBuilder builds the widget tree for each row.
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Text('Detail Page');
                    },
                  ),
                );
              },
              child: buildRecipeCrd(
                (Recipe.recipes[index]),
              ),
            );
          },
          //itemCount determines the number of rows the list has
          itemCount: Recipe.recipes.length,
        ),
      ),
    );
  }
* */

/*
Step 5:=>Add Recipe Detail page to navigation

      return RecipeDetail(Recipe.recipes[index]);
* */
