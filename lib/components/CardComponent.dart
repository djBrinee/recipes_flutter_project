import 'package:flutter/material.dart';
import 'package:menu/models/recipe.dart';
import 'package:menu/screens/recipeDetail.dart';

class CardComponent extends StatelessWidget {
  final Recipe recipe;

  const CardComponent({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RecipeDetail(recipe: recipe)));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 400,
          width: 400,
          child: Column(
            children: [
              SizedBox(
                height: 372, // Desired height of the image
                width: 400, // Desired width of the image
                child: Image(
                  image: AssetImage(recipe.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(recipe.label, style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
