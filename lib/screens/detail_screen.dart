import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> cocktail;
  const DetailScreen({super.key, required this.cocktail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cocktail['strDrink'], style: const TextStyle(fontSize: 28)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.network(
                      cocktail['strDrinkThumb'],
                      height: 300,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(height: 20),
            Text('Category: ${cocktail['strCategory']}',
                style: const TextStyle(fontSize: 21)),
            const SizedBox(height: 5),
            Text('Glass: ${cocktail['strGlass']}',
                style: const TextStyle(fontSize: 21)),
            const SizedBox(height: 5),
            Text('Instructions: ${cocktail['strInstructions']}',
                style: const TextStyle(fontSize: 21)),
            const SizedBox(height: 5),
            Text('Alcohol: ${cocktail['strAlcoholic']}',
                style: const TextStyle(fontSize: 21)),
          ],
        ),
      ),
    );
  }
}
