import 'package:flutter/material.dart';
import '../../../screens/autor/autor.dart';
import '../../../screens/home/pages/widgets/pokemon_item_widget.dart';
import '../../../../../common/models/pokemon.dart';
import '../../details/container/detail_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.list, required this.onItemTap})
      : super(key: key);
  final List<Pokemon> list;
  final Function(String, DetailArguments) onItemTap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'Pokedex',
            style: TextStyle(color: Colors.black, fontSize: 26),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const AutorPage(),),);
              },
              icon: const Icon(
                Icons.account_circle,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: list
              .map(
                (e) => PokemonItemWidget(
                  pokemon: e,
                  onTap: onItemTap,
                  index: list.indexOf(e),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
