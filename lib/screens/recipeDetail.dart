import 'package:flutter/material.dart';
import 'package:menu/models/recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  RecipeDetail({required this.recipe});

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int servings = 0;

  @override
  void initState() {
    super.initState();
    servings = widget.recipe.servings;
  }

  @override
  Widget build(BuildContext context) {
    List<Ingredient> ingredients = widget.recipe.ingredients;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                width: 400,
                height: 380,
                child: Image(
                  image: AssetImage(widget.recipe.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                widget.recipe.label,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 38),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 18.0),
              child: Text(
                "Ingredients",
                style: TextStyle(color: Colors.brown, fontSize: 25),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: ListView(
                  children: ingredients.map((ingredient) {
                    return Center(
                      child: Text(
                        "${(ingredient.quantity * servings).toStringAsFixed(2)}, ${ingredient.measure}, ${ingredient.name}",
                        style: TextStyle(fontSize: 17.0),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Servings: ",
                  style:
                      TextStyle(color: Colors.blueGrey, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "$servings",
                  style: const TextStyle(color: Colors.blue, fontSize: 20),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, bottom: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: const RoundSliderOverlayShape(overlayRadius: 10),
                        overlayColor: Colors.blue,
                        thumbColor: Colors.amber,
                        activeTrackColor: Colors.amber,
                        inactiveTickMarkColor: const Color(0XFF952552),
                      ),
                      child: Slider(
                        value: servings.toDouble(),
                        min: 1,
                        max: 50,
                        onChanged: (newValue) {
                          setState(() {
                            servings = newValue.round();
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
