import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'common/repositories/pokemon_repository.dart';
import 'features/pokedex/route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: PokedexRoute(
        repository: PokemonRepository(
          dio: Dio(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );

  }
}
