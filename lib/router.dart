import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/buisniss_logic/cubit/cubit/character_cubit.dart';
import 'package:rickandmorty/constans/strings.dart';
import 'package:rickandmorty/data/api/characters_api.dart';
import 'package:rickandmorty/data/repository/characters_repo.dart';
import 'package:rickandmorty/presntion/screens/details_screen.dart';
import 'package:rickandmorty/presntion/screens/home_screen.dart';

class Approuter {
  late CharactersRepo charactersRepo;
  late CharacterCubit characterCubit;
  Approuter() {
    charactersRepo = CharactersRepo(charactersapi: Charactersapi());
    characterCubit = CharacterCubit(charactersRepo);
  }

  Route? generaterouter(RouteSettings setting) {
    switch (setting.name) {
      case homescreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => characterCubit,
                  child: Homescreen(),
                ));
      case detalisscreen:
        return MaterialPageRoute(builder: (_) => DetailsScreen());
    }
  }
}
