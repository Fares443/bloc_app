import 'package:bloc_app/data/repstry/character_Repository.dart';
import 'package:bloc_app/data/web_server/character_webservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'businses_logec/constans/Strings.dart';
import 'businses_logec/cubit/character_cubit.dart';
import 'data/model/chatacter.dart';
import 'presention/screens/CharacterDetailsScreen.dart';
import 'presention/screens/character_Screen.dart';

class AppRouter {
  late CharacterRepository characterRepository;
  late CharactersCubit charactersCubit;
  AppRouter() {
    characterRepository = CharacterRepository(CharacterWebServices());
    charactersCubit = CharactersCubit(characterRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: const CharacterScreen(),
          ),
        );
      case characterDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (context) => CharacterDetailsScreen(character: character),
        );
    }
  }
}
