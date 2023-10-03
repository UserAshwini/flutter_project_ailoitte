import 'dart:convert';
import 'package:flutter_project_ailoitte/screens/detail_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<dynamic> cocktails = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=rum'));

    if (response.statusCode == 200) {
      setState(() {
        cocktails = json.decode(response.body)['drinks'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cocktail Listing',style:  TextStyle(fontSize: 28 )),
      ),
      body: cocktails.isEmpty
          ? const Center(child: CircularProgressIndicator(color: Colors.grey,))
          : Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView.builder(
                itemCount: cocktails.length,
                itemBuilder: (context, index) {
                  final cocktail = cocktails[index];
                  return ListTile(
                    title: Text(cocktail['strDrink'],style: const TextStyle(fontSize: 21 ),),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(cocktail: cocktail),
                        ),
                      );
                    },
                  );
                },
              ),
          ),
    );
  }
}