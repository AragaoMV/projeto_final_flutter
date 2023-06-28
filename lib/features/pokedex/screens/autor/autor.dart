import "package:flutter/material.dart";

class AutorPage extends StatelessWidget {
  const AutorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Descrição"),
      ),
      body: Column(
        children: const [
          Text('Pokedex dos 151 Pokemon via web api, usando Dio'),
          Text('Link Api: https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json'),
          Text('Autor: Marcos Vinicius Silva Aragão'),
          Text('email para contato: marcosvinisa@icloud.com'),
        ],
      )
    );
  }
}
