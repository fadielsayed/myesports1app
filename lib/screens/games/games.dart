import 'package:flutter/material.dart';
import 'package:myesports1app/screens/games/game_detail.dart';
import 'package:myesports1app/screens/games/games_all.dart';
import 'package:myesports1app/utils/constants.dart';
import 'package:myesports1app/utils/data.dart';


class Games extends StatefulWidget {
  @override
  _GamesState createState() => _GamesState();
}

class _GamesState extends State<Games> {

  Widget currentWidgetView;

  @override
  void initState() {
    super.initState();
    switchTo("games_all", null);
  }

  switchTo(String widgetName, Game game){
    setState(() {
      switch (widgetName){
        case "games_all":
          currentWidgetView = GamesAll(
            onPress: (game) {
              switchTo("game_detail", game);
            }
          );
          break;
        case "game_detail":
          currentWidgetView = GameDetail(
            game: game,
            onPress: () {
              switchTo("games_all", null);
            }
          );
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 250),
        child: currentWidgetView,
      ),
    );
  }
}