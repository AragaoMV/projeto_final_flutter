import 'package:flutter/material.dart';
import '../../../../../common/error/failure.dart';
import '../../../../../common/models/pokemon.dart';
import '../../../screens/details/container/detail_container.dart';
import '../../../screens/home/pages/home_error.dart';
import '../../../screens/home/pages/home_loading.dart';
import '../../../screens/home/pages/home_page.dart';

import '../../../../../common/repositories/pokemon_repository.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    Key? key,
    required this.repository,
    required this.onItemTap,
  }) : super(key: key);
  final IPokemonRepository repository;
  final Function(String, DetailArguments) onItemTap;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const HomeLoading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(
            list: snapshot.data!,
            onItemTap: onItemTap,
          );
        }

        if (snapshot.hasError) {
          return HomeError(
            error: (snapshot.error as Failure).message!,
          );
        }

        return Container();
      },
    );
  }
}
