

import 'package:ayath_prayer_new/data/dua_category_item.dart';
import 'package:ayath_prayer_new/data/dua_item.dart';
import 'package:flutter/material.dart';

import 'dua_page.dart';

const kIcons = <DuaPage>[
  // DuaPage(id: 1),
  // DuaPage(id: 2),
  // DuaPage(id: 3),
  // Icon(Icons.event),
  // Icon(Icons.home),
  // Icon(Icons.android),
  // Icon(Icons.alarm),
  // Icon(Icons.face),
  // Icon(Icons.language),

];

class SwipablePrayerList extends StatefulWidget {
  final List<DuaItem> items;

  const SwipablePrayerList({
    required this.items,
    required int? childItemId,
    Key? key,
    //required this.widget,
  }) : super(key: key);

  @override
  State<SwipablePrayerList> createState() => _SwipablePrayerListState();
}

class _SwipablePrayerListState extends State<SwipablePrayerList> {

  final topAppBar = AppBar(
    elevation: 0.8,
    backgroundColor: Colors.white, //.fromRGBO(58, 66, 86, 1.0),
    title: SizedBox(
      child: Text("Prayers bashasjdv ",
          style: TextStyle(
            color: Color(0x80006400),
          )),
    ),
    // actions: <Widget>[
    //   IconButton(
    //     icon: Icon(
    //       Icons.list,
    //       color: Color(0x80006400),
    //     ),
    //     onPressed: () {},
    //   )
    // ],
  );


  List<DuaPage> prepare(){

    List<DuaPage> pages = [];
    print("widget.item");
    print(widget.items.length);
    for (var e in widget.items) {
      pages.add(DuaPage(id: 0, arabic: e.arabic, translation: e.translation, count: e.count?.toInt() ?? 0));
      // pages.add(DuaPage(id: 1,arabic: "وَاذْكُرْ رَّبَّكَ فِيْ نَفْسِكَ تَضَرُّعًا وَّخِيْفَةً وَّدُوْنَ الْجَــهْرِ مِنَ الْقَوْلِ بِالْغُدُوِّ وَالْاٰصَالِ وَلَا تَكُنْ مِّنَ الْغٰفِلِيْن",count: 5,translation: "asdasdash asd as ashd asjhdjasghdhasg dgas dasgdgasdjaksgdkjahsggdjghasdj asdjasg das djd",)),
      // pages.add(DuaPage(id: 1,arabic: "وَاذْكُرْ رَّبَّكَ فِيْ نَفْسِكَ تَضَرُّعًا وَّخِيْفَةً وَّدُوْنَ الْجَــهْرِ مِنَ الْقَوْلِ بِالْغُدُوِّ وَالْاٰصَالِ وَلَا تَكُنْ مِّنَ الْغٰفِلِيْن",count: 5,translation: "asdasdash asd as ashd asjhdjasghdhasg dgas dasgdgasdjaksgdkjahsggdjghasdj asdjasg das djd",)),
      // pages.add(DuaPage(id: 1,arabic: "وَاذْكُرْ رَّبَّكَ فِيْ نَفْسِكَ تَضَرُّعًا وَّخِيْفَةً وَّدُوْنَ الْجَــهْرِ مِنَ الْقَوْلِ بِالْغُدُوِّ وَالْاٰصَالِ وَلَا تَكُنْ مِّنَ الْغٰفِلِيْن",count: 5,translation: "asdasdash asd as ashd asjhdjasghdhasg dgas dasgdgasdjaksgdkjahsggdjghasdj asdjasg das djd",)),
      // pages.add(DuaPage(id: 1,arabic: "وَاذْكُرْ رَّبَّكَ فِيْ نَفْسِكَ تَضَرُّعًا وَّخِيْفَةً وَّدُوْنَ الْجَــهْرِ مِنَ الْقَوْلِ بِالْغُدُوِّ وَالْاٰصَالِ وَلَا تَكُنْ مِّنَ الْغٰفِلِيْن",count: 5,translation: "asdasdash asd as ashd asjhdjasghdhasg dgas dasgdgasdjaksgdkjahsggdjghasdj asdjasg das djd",)),

    }
    print(pages.length);
    return pages;
  }
  //final MyHomePage widget;
  @override
  Widget build(BuildContext context) {
    List<DuaPage> ico = prepare();
    return Scaffold(
        appBar: topAppBar,
        body: DefaultTabController(
          length: ico.length,
          // Use a Builder here, otherwise `DefaultTabController.of(context)` below
          // returns null.
          child: Builder(
            builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  //const TabPageSelector(),
                  Expanded(
                    child: IconTheme(
                      data: IconThemeData(
                        size: 128.0,
                        color: Color(0x80006400),
                      ),
                      child: TabBarView(children: ico),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}