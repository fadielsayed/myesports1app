import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:myesports1app/screens/explore/explore.dart';
import 'package:myesports1app/screens/games/games.dart';
import 'package:myesports1app/screens/profile/profile.dart';
import 'package:myesports1app/screens/search/search.dart';
import 'package:myesports1app/utils/constants.dart';
import 'package:myesports1app/shared/bottom_navigation_item.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Master extends StatefulWidget {
  @override
  _MasterState createState() => _MasterState();
}

class _MasterState extends State<Master> {

  List<bool> bottomNavigationItemStatus = [true,false,false,false];

  Widget currentWidgetView;

  @override
  void initstate(){
    super.initState();
    setState(() {
      currentWidgetView = Explore();
    });
  }

  setcurrentWidgetView (int index){
    setState(() {
      switch(index){
        case 0: currentWidgetView = Explore(); break;
        case 1: currentWidgetView = Search(); break;
        case 2: currentWidgetView = Games(); break;
        case 3: currentWidgetView = Profile(); break;
      }
      bottomNavigationItemStatus = [index == 0,index == 1, index == 2,index == 3];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 250),
        child: currentWidgetView,
      ),
      bottomNavigationBar: Container(
        height: 80,
        padding: EdgeInsets.only(bottom: 10,),
        color: kBottomNavigationBar,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            BottomNavigationItem(
              iconData: Icons.home,
              selected: bottomNavigationItemStatus[0],
              onPress: () {
                setcurrentWidgetView(0);
              },
            ),

            BottomNavigationItem(
              iconData: Icons.search,
              selected: bottomNavigationItemStatus[1],
              onPress: () {
                setcurrentWidgetView(1);
              },
            ),

            BottomNavigationItem(
              iconData: Ionicons.ios_trophy,
              selected: bottomNavigationItemStatus[2],
              onPress: () {
                setcurrentWidgetView(2);
              },
            ),

            BottomNavigationItem(
              iconData: Icons.supervised_user_circle,
              selected: bottomNavigationItemStatus[3],
              onPress: () {
                setcurrentWidgetView(3);
              },
            ),

          ],
        ),
      ),
    );
  }
}