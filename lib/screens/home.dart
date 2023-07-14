import 'package:flutter/material.dart';
import 'package:menu/components/CardComponent.dart';
import 'package:menu/models/recipe.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final List<Recipe> samples = Recipe.samples;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: samples.length,
        itemBuilder: (BuildContext context, int index) {
          return CardComponent(recipe: samples[index]);
        });
  }
}
