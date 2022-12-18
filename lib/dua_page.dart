import 'package:ayath_prayer_new/data/user_count_with_favourite.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'dart:math' as math;
import 'data/dua_category_item.dart';
import 'fitness_app_theme.dart';
import 'home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
//import 'package:google_fonts/google_fonts.dart';

const kHiveFolder = 'hive';
const kHiveBoxName = 'countWithDuaBox';

class DuaPage extends StatefulWidget {
  final int id;

  DuaPage(
      {Key? key,
        required this.id,
        required this.arabic,
        required this.translation,
        required this.count
      }) :
        userCount = 0,
        super(key: key)
  ;


  final String arabic;
  final String translation;
  final num count;
  int userCount;

  // num count = id;

  @override
  State<DuaPage> createState() => _DuaPageState();
}



class _DuaPageState extends State<DuaPage> {
  late final Box<UserCountWithFavourite> box;
  //var userCount = 0;

  Future<void> _addTodoItem() async {
    var todo = UserCountWithFavourite(duaId: 1,userCount: 1);
    //final box = Hive.box<UserCountWithFavourite>(kHiveBoxName);
    final int key = await box.add(todo);
    // Set the id field to the auto-incremented key.
    todo.id = key;
    await todo.save();
    print('Inserted: key=$key, value=$todo');
  }

  _updateInfo(int userCount) async {
    print(userCount);
    print(' updateding in box!');
    var todo = UserCountWithFavourite(duaId: 1,userCount: userCount,id:1);
    todo.userCount = userCount;
    await box.putAt(1, todo);
   // todo.save();

    print('Info updated in box!');
    print(todo);
  }

  int? _getTodoItems() {

    //final box = Hive.box<DuaCatergoryItem>(kHiveBoxName);
    var todo = box.get(1,defaultValue: UserCountWithFavourite(duaId: 2,userCount: 100));
    //final List<UserCountWithFavourite> todos = box.values.toList();
    print('Hive initialization done, todo items in the db are:');
print(todo);
    return todo?.userCount;
  }

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
   // Hive.registerAdapter(UserCountWithFavouriteAdapter());
    //await Hive.openBox<UserCountWithFavourite>(kHiveBoxName);
     box = Hive.box<UserCountWithFavourite>(kHiveBoxName);
    //_addTodoItem();
    widget.userCount =  _getTodoItems() ?? 1001;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Container(
              //color: Colors.green,
              decoration: BoxDecoration(
                color: HexColor("#FFFFFF"), //#D7E0F9
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topRight: Radius.circular(8.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: FitnessAppTheme.grey.withOpacity(0.2),
                      offset: Offset(1.1, 1.1),
                      blurRadius: 10.0),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                height: 48,
                                width: 2,
                                decoration: BoxDecoration(
                                  color: Color(0x80006400),
                                  // HexColor('#7897a7') //#40802b //87A0E5
                                  //     .withOpacity(1),//0.5
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 4, bottom: 2),
                                      child: Text(
                                        'Total ',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: FitnessAppTheme.fontName,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          letterSpacing: -0.1,
                                          color: FitnessAppTheme.grey
                                              .withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 28,
                                          height: 28,
                                          child: Icon(Icons.ac_unit, size: 25),
                                          // Image.asset(
                                          //     "assets/fitness_app/eaten.png"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 4, bottom: 3),
                                          child: Text(
                                            "${widget.count}",
                                            // '${(widget.count * widget.animation!.value).toInt()}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily:
                                                  FitnessAppTheme.fontName,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: FitnessAppTheme.darkerText,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 4, bottom: 3),
                                          child: Text(
                                            ' ',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily:
                                                  FitnessAppTheme.fontName,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              letterSpacing: -0.2,
                                              color: FitnessAppTheme.grey
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {
                      print("tap $widget.userCount   ${widget.count} "),
                      if (widget.userCount < widget.count)
                        {
                          print("taptap ${widget.userCount}    ${widget.count} "),
                         // userCount = userCount + 1,

                          setState(() {
                            //print("taptap $userCount   $widget.count ${widget.animation!.value}");
                            widget.userCount++;
                            _updateInfo(widget.userCount);
                          }),

                          //   ),
                        }
                    },
                    onHorizontalDragEnd: (a) => {
                      print("onHorizontalDragEnd"),
                      print(a),
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Center(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FitnessAppTheme.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100.0),
                                  ),
                                  border: new Border.all(
                                      width: 4,
                                      color: Color(0x80006400)
                                          .withOpacity(0.2)),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      //'${(_userCount = 0 * widget.animation!.value).toInt()}',
                                      // userCount,
                                      '${widget.userCount.toInt()}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: FitnessAppTheme.fontName,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 24,
                                        letterSpacing: 0.0,
                                        color:Color(0x80006400),
                                      ),
                                    ),
                                    Text(
                                      'Duas left',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: FitnessAppTheme.fontName,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        letterSpacing: 0.0,
                                        color: FitnessAppTheme.grey
                                            .withOpacity(0.5),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: CustomPaint(
                                painter: CurvePainter(
                                  colors: [
                                    Color(0x80006400),
                                    Color(0x80006400),
                                    Color(0x80006400),
                                  ],
                                  angle: (((widget.userCount / widget.count)) * 360),
                                ),
                                // angle: 360 +
                                //     (360 - 140) *
                                //         (0.0 - widget.animation!.value)),
                                child: SizedBox(
                                  width: 108,
                                  height: 108,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
            child: Container(
              height: 2,
              decoration: BoxDecoration(
                // color: FitnessAppTheme.background,
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
            ),
          ),
          Expanded(
            //color: Colors.yellow,
            //width: double.infinity,

            child: SingleChildScrollView(
              child: GestureDetector(
                onTap: () => {
                  print("tap ${widget.userCount}   ${widget.count} "),
                  if (widget.userCount < widget.count)
                    {
                      print("taptap ${widget.userCount}    ${widget.count} "),

                      setState(() {
                        //print("taptap $userCount   $widget.count ${widget.animation!.value}");
                        if (widget.userCount < widget.count) widget.userCount++;
                      }),
                    _updateInfo(widget.userCount),
                      //   ),
                    }
                },
                child: Column(
                  children: listDuas(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> listDuas() {
    List<Widget> duaWidgets = [];
    // widget.dua.forEach((element) {
    //   print(element);
    duaWidgets.add(Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: HexColor("#FFFFFF"), //#D7E0F9
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topRight: Radius.circular(8.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: FitnessAppTheme.grey.withOpacity(0.2),
                offset: Offset(1.1, 1.1),
                blurRadius: 10.0),
          ],
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 12, bottom: 12, right: 16, top: 12),
              child: Text(
                widget.arabic,
                textAlign: TextAlign.right,
                // style: GoogleFonts.aladin(
                //   fontWeight: FontWeight.w500,
                //   fontSize: 25,
                //   letterSpacing: 0.0,
                //   color: FitnessAppTheme.nearlyDarkBlue
                //       .withOpacity(0.6),
                // ),
                style: GoogleFonts.getFont(
                  'Scheherazade New',
                  textStyle: TextStyle(
                    // fontFamily: FitnessAppTheme.fontName,
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    letterSpacing: 0.1,
                    color: FitnessAppTheme.nearlyDarkBlue.withOpacity(0.6),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
    duaWidgets.add(Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: HexColor("#FFFFFF"),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topRight: Radius.circular(8.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: FitnessAppTheme.grey.withOpacity(0.2),
                offset: Offset(1.1, 1.1),
                blurRadius: 10.0),
          ],
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 12, bottom: 16, right: 16, top: 12),
              child: Text(
               widget.translation,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: FitnessAppTheme.fontName,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  letterSpacing: 0.0,
                  color: FitnessAppTheme.nearlyDarkBlue.withOpacity(0.6),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
    duaWidgets.add(Visibility(
      maintainSize: false,
      maintainAnimation: true,
      maintainState: true,
      visible: false,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
        child: Container(
          child: Text(
            widget.translation,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    ));
    duaWidgets.add(SizedBox(
      width: 108,
      height: 30,
    ));
    // });

    // duaWidgets.add(Padding(
    //   padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
    //   child: Container(
    //     width: double.infinity,
    //     alignment: Alignment.bottomCenter,
    //     decoration: BoxDecoration(
    //       color: HexColor("#FFFFFF"), //#D7E0F9
    //       borderRadius: BorderRadius.only(
    //           topLeft: Radius.circular(8.0),
    //           bottomLeft: Radius.circular(8.0),
    //           bottomRight: Radius.circular(8.0),
    //           topRight: Radius.circular(8.0)),
    //       boxShadow: <BoxShadow>[
    //         BoxShadow(
    //             color: FitnessAppTheme.grey.withOpacity(0.2),
    //             offset: Offset(1.1, 1.1),
    //             blurRadius: 10.0),
    //       ],
    //     ),
    //     child: Column(
    //       children: <Widget>[
    //         Padding(
    //           padding: const EdgeInsets.only(
    //               left: 12, bottom: 12, right: 16, top: 12),
    //           child: Text(
    //             "قُلْ هُوَ اللَّهُ أَحَد ٌ",
    //             // textAlign: TextAlign.right,
    //             textDirection: TextDirection.rtl,
    //             style: GoogleFonts.getFont(
    //               'Scheherazade New',
    //               textStyle: TextStyle(
    //                 // fontFamily: FitnessAppTheme.fontName,
    //                 //fontWeight: FontWeight.w500,
    //                 fontSize: 20,
    //                 letterSpacing: 0.1,
    //                 color: FitnessAppTheme.nearlyDarkBlue.withOpacity(0.6),
    //               ),
    //             ),
    //             // strutStyle: StrutStyle(
    //             // //  fontFamily: 'FontName',
    //             //   forceStrutHeight: true,
    //             // ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // ));
    // duaWidgets.add(Padding(
    //   padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
    //   child: Container(
    //     width: double.infinity,
    //     alignment: Alignment.bottomLeft,
    //     decoration: BoxDecoration(
    //       color: HexColor("#FFFFFF"),
    //       borderRadius: BorderRadius.only(
    //           topLeft: Radius.circular(8.0),
    //           bottomLeft: Radius.circular(8.0),
    //           bottomRight: Radius.circular(8.0),
    //           topRight: Radius.circular(8.0)),
    //       boxShadow: <BoxShadow>[
    //         BoxShadow(
    //             color: FitnessAppTheme.grey.withOpacity(0.2),
    //             offset: Offset(1.1, 1.1),
    //             blurRadius: 10.0),
    //       ],
    //     ),
    //     child: Column(
    //       children: <Widget>[
    //         Padding(
    //           padding: const EdgeInsets.only(
    //               left: 12, bottom: 16, right: 16, top: 12),
    //           child: Text(
    //             "With the Name of Allah, the Most Gracious, the Most Merciful. Say: He is Allah (the) One. The Self-Sufficient Master, Whom all creatures need, He begets not nor was He begotten, and there is none equal to Him",
    //             textAlign: TextAlign.left,
    //             style: TextStyle(
    //               fontFamily: FitnessAppTheme.fontName,
    //               fontWeight: FontWeight.w500,
    //               fontSize: 14,
    //               letterSpacing: 0.0,
    //               color: FitnessAppTheme.nearlyDarkBlue.withOpacity(0.6),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // ));
    // duaWidgets.add(Visibility(
    //   maintainSize: false,
    //   maintainAnimation: true,
    //   maintainState: true,
    //   visible: false,
    //   child: Padding(
    //     padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
    //     child: Container(
    //       child: Text(
    //         "asjjabsfjkabj bv  basbj avj ja valvbdaasjjabsfjkabj bv  basbj avj ja valvbdaasjjabsfjkabj bv  basbj avj ja valvbdaasjjabsfjkabj bv  basbj avj ja valvbda"
    //         "asjjabsfjkabj bv  basbj avj ja valvbdaasjjabsfjkabj bv  basbj avj ja valvbdaasjjabsfjkabj bv  basbj avj ja valvbda",
    //         style: TextStyle(color: Colors.black),
    //       ),
    //     ),
    //   ),
    // ));
    // duaWidgets.add(SizedBox(
    //   width: 108,
    //   height: 30,
    // ));
    //
    // duaWidgets.add(Padding(
    //   padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
    //   child: Container(
    //     width: double.infinity,
    //     alignment: Alignment.bottomRight,
    //     decoration: BoxDecoration(
    //       color: HexColor("#FFFFFF"), //#D7E0F9
    //       borderRadius: BorderRadius.only(
    //           topLeft: Radius.circular(8.0),
    //           bottomLeft: Radius.circular(8.0),
    //           bottomRight: Radius.circular(8.0),
    //           topRight: Radius.circular(8.0)),
    //       boxShadow: <BoxShadow>[
    //         BoxShadow(
    //             color: FitnessAppTheme.grey.withOpacity(0.2),
    //             offset: Offset(1.1, 1.1),
    //             blurRadius: 10.0),
    //       ],
    //     ),
    //     child: Column(
    //       children: <Widget>[
    //         Padding(
    //           padding: const EdgeInsets.only(
    //               left: 12, bottom: 12, right: 16, top: 12),
    //           child: Text(
    //             " اللَّهُ الصَّمَدُ ",
    //             textDirection: TextDirection.rtl,
    //             style: GoogleFonts.getFont(
    //               'Scheherazade New',
    //               textStyle: TextStyle(
    //                 // fontFamily: FitnessAppTheme.fontName,
    //                 //fontWeight: FontWeight.w500,
    //                 fontSize: 20,
    //                 letterSpacing: 0.1,
    //                 color: FitnessAppTheme.nearlyDarkBlue.withOpacity(0.6),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // ));
    // duaWidgets.add(Padding(
    //   padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
    //   child: Container(
    //     width: double.infinity,
    //     alignment: Alignment.bottomLeft,
    //     decoration: BoxDecoration(
    //       color: HexColor("#FFFFFF"),
    //       borderRadius: BorderRadius.only(
    //           topLeft: Radius.circular(8.0),
    //           bottomLeft: Radius.circular(8.0),
    //           bottomRight: Radius.circular(8.0),
    //           topRight: Radius.circular(8.0)),
    //       boxShadow: <BoxShadow>[
    //         BoxShadow(
    //             color: FitnessAppTheme.grey.withOpacity(0.2),
    //             offset: Offset(1.1, 1.1),
    //             blurRadius: 10.0),
    //       ],
    //     ),
    //     child: Column(
    //       children: <Widget>[
    //         Padding(
    //           padding: const EdgeInsets.only(
    //               left: 12, bottom: 16, right: 16, top: 12),
    //           child: Text(
    //             "With the Name of Allah, the Most Gracious, the Most Merciful. Say: He is Allah (the) One. The Self-Sufficient Master, Whom all creatures need, He begets not nor was He begotten, and there is none equal to Him",
    //             textAlign: TextAlign.left,
    //             style: TextStyle(
    //               fontFamily: FitnessAppTheme.fontName,
    //               fontWeight: FontWeight.w500,
    //               fontSize: 14,
    //               letterSpacing: 0.0,
    //               color: FitnessAppTheme.nearlyDarkBlue.withOpacity(0.6),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // ));
    // duaWidgets.add(Visibility(
    //   maintainSize: false,
    //   maintainAnimation: true,
    //   maintainState: true,
    //   visible: false,
    //   child: Padding(
    //     padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
    //     child: Container(
    //       child: Text(
    //         "asjjabsfjkabj bv  basbj avj ja valvbdaasjjabsfjkabj bv  basbj avj ja valvbdaasjjabsfjkabj bv  basbj avj ja valvbdaasjjabsfjkabj bv  basbj avj ja valvbda"
    //         "asjjabsfjkabj bv  basbj avj ja valvbdaasjjabsfjkabj bv  basbj avj ja valvbdaasjjabsfjkabj bv  basbj avj ja valvbda",
    //         style: TextStyle(color: Colors.black),
    //       ),
    //     ),
    //   ),
    // ));
    // duaWidgets.add(SizedBox(
    //   width: 108,
    //   height: 30,
    // ));
    //
    // duaWidgets.add(Padding(
    //   padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
    //   child: Container(
    //     width: double.infinity,
    //     alignment: Alignment.bottomRight,
    //     decoration: BoxDecoration(
    //       color: HexColor("#FFFFFF"), //#D7E0F9
    //       borderRadius: BorderRadius.only(
    //           topLeft: Radius.circular(8.0),
    //           bottomLeft: Radius.circular(8.0),
    //           bottomRight: Radius.circular(8.0),
    //           topRight: Radius.circular(8.0)),
    //       boxShadow: <BoxShadow>[
    //         BoxShadow(
    //             color: FitnessAppTheme.grey.withOpacity(0.2),
    //             offset: Offset(1.1, 1.1),
    //             blurRadius: 10.0),
    //       ],
    //     ),
    //     child: Column(
    //       children: <Widget>[
    //         Padding(
    //           padding: const EdgeInsets.only(
    //               left: 12, bottom: 12, right: 16, top: 12),
    //           child: Text(
    //             "لَمْ يَلِدْ وَلَمْ يُولَدْ",
    //             textAlign: TextAlign.right,
    //             // style: GoogleFonts.aladin(
    //             //   fontWeight: FontWeight.w500,
    //             //   fontSize: 25,
    //             //   letterSpacing: 0.0,
    //             //   color: FitnessAppTheme.nearlyDarkBlue
    //             //       .withOpacity(0.6),
    //             // ),
    //             style: TextStyle(
    //               fontFamily: FitnessAppTheme.fontName,
    //               fontWeight: FontWeight.w500,
    //               fontSize: 25,
    //               letterSpacing: 0.0,
    //               color: FitnessAppTheme.nearlyDarkBlue.withOpacity(0.6),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // ));
    // duaWidgets.add(Padding(
    //   padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
    //   child: Container(
    //     width: double.infinity,
    //     alignment: Alignment.bottomLeft,
    //     decoration: BoxDecoration(
    //       color: HexColor("#FFFFFF"),
    //       borderRadius: BorderRadius.only(
    //           topLeft: Radius.circular(8.0),
    //           bottomLeft: Radius.circular(8.0),
    //           bottomRight: Radius.circular(8.0),
    //           topRight: Radius.circular(8.0)),
    //       boxShadow: <BoxShadow>[
    //         BoxShadow(
    //             color: FitnessAppTheme.grey.withOpacity(0.2),
    //             offset: Offset(1.1, 1.1),
    //             blurRadius: 10.0),
    //       ],
    //     ),
    //     child: Column(
    //       children: <Widget>[
    //         Padding(
    //           padding: const EdgeInsets.only(
    //               left: 12, bottom: 16, right: 16, top: 12),
    //           child: Text(
    //             "With the Name of Allah, the Most Gracious, the Most Merciful. Say: He is Allah (the) One. The Self-Sufficient Master, Whom all creatures need, He begets not nor was He begotten, and there is none equal to Him",
    //             textAlign: TextAlign.left,
    //             style: TextStyle(
    //               fontFamily: FitnessAppTheme.fontName,
    //               fontWeight: FontWeight.w500,
    //               fontSize: 14,
    //               letterSpacing: 0.0,
    //               color: FitnessAppTheme.nearlyDarkBlue.withOpacity(0.6),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // ));
    // duaWidgets.add(Visibility(
    //   maintainSize: false,
    //   maintainAnimation: true,
    //   maintainState: true,
    //   visible: false,
    //   child: Padding(
    //     padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
    //     child: Container(
    //       child: Text(
    //         "asjjabsfjkabj bv  basbj avj ja valvbdaasjjabsfjkabj bv  basbj avj ja valvbdaasjjabsfjkabj bv  basbj avj ja valvbdaasjjabsfjkabj bv  basbj avj ja valvbda"
    //         "asjjabsfjkabj bv  basbj avj ja valvbdaasjjabsfjkabj bv  basbj avj ja valvbdaasjjabsfjkabj bv  basbj avj ja valvbda",
    //         style: TextStyle(color: Colors.black),
    //       ),
    //     ),
    //   ),
    // ));
    // duaWidgets.add(SizedBox(
    //   width: 108,
    //   height: 30,
    // ));
    //
    // duaWidgets.add(Padding(
    //   padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
    //   child: Container(
    //     width: double.infinity,
    //     alignment: Alignment.bottomRight,
    //     decoration: BoxDecoration(
    //       color: HexColor("#FFFFFF"), //#D7E0F9
    //       borderRadius: BorderRadius.only(
    //           topLeft: Radius.circular(8.0),
    //           bottomLeft: Radius.circular(8.0),
    //           bottomRight: Radius.circular(8.0),
    //           topRight: Radius.circular(8.0)),
    //       boxShadow: <BoxShadow>[
    //         BoxShadow(
    //             color: FitnessAppTheme.grey.withOpacity(0.2),
    //             offset: Offset(1.1, 1.1),
    //             blurRadius: 10.0),
    //       ],
    //     ),
    //     child: Column(
    //       children: <Widget>[
    //         Padding(
    //           padding: const EdgeInsets.only(
    //               left: 12, bottom: 12, right: 16, top: 12),
    //           child: Text(
    //             "وَلَمْ يَكُن لَّهُ كُفُوًا أَحَدٌ",
    //             textAlign: TextAlign.right,
    //             // style: GoogleFonts.aladin(
    //             //   fontWeight: FontWeight.w500,
    //             //   fontSize: 25,
    //             //   letterSpacing: 0.0,
    //             //   color: FitnessAppTheme.nearlyDarkBlue
    //             //       .withOpacity(0.6),
    //             // ),
    //             style: TextStyle(
    //               fontFamily: FitnessAppTheme.fontName,
    //               fontWeight: FontWeight.w500,
    //               fontSize: 25,
    //               letterSpacing: 0.0,
    //               color: FitnessAppTheme.nearlyDarkBlue.withOpacity(0.6),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // ));
    // duaWidgets.add(Padding(
    //   padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
    //   child: Container(
    //     width: double.infinity,
    //     alignment: Alignment.bottomLeft,
    //     decoration: BoxDecoration(
    //       color: HexColor("#FFFFFF"),
    //       borderRadius: BorderRadius.only(
    //           topLeft: Radius.circular(8.0),
    //           bottomLeft: Radius.circular(8.0),
    //           bottomRight: Radius.circular(8.0),
    //           topRight: Radius.circular(8.0)),
    //       boxShadow: <BoxShadow>[
    //         BoxShadow(
    //             color: FitnessAppTheme.grey.withOpacity(0.2),
    //             offset: Offset(1.1, 1.1),
    //             blurRadius: 10.0),
    //       ],
    //     ),
    //     child: Column(
    //       children: <Widget>[
    //         Padding(
    //           padding: const EdgeInsets.only(
    //               left: 12, bottom: 16, right: 16, top: 12),
    //           child: Text(
    //             "With the Name of Allah, the Most Gracious, the Most Merciful. Say: He is Allah (the) One. The Self-Sufficient Master, Whom all creatures need, He begets not nor was He begotten, and there is none equal to Him",
    //             textAlign: TextAlign.left,
    //             style: TextStyle(
    //               fontFamily: FitnessAppTheme.fontName,
    //               fontWeight: FontWeight.w500,
    //               fontSize: 14,
    //               letterSpacing: 0.0,
    //               color: FitnessAppTheme.nearlyDarkBlue.withOpacity(0.6),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // ));
    // duaWidgets.add(Visibility(
    //   maintainSize: false,
    //   maintainAnimation: true,
    //   maintainState: true,
    //   visible: false,
    //   child: Padding(
    //     padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
    //     child: Container(
    //       child: Text(
    //         "asjjabsfjkabj bv  basbj avj ja valvbdaasjjabsfjkabj bv  basbj avj ja valvbdaasjjabsfjkabj bv  basbj avj ja valvbdaasjjabsfjkabj bv  basbj avj ja valvbda"
    //         "asjjabsfjkabj bv  basbj avj ja valvbdaasjjabsfjkabj bv  basbj avj ja valvbdaasjjabsfjkabj bv  basbj avj ja valvbda",
    //         style: TextStyle(color: Colors.black),
    //       ),
    //     ),
    //   ),
    // ));
    // duaWidgets.add(SizedBox(
    //   width: 108,
    //   height: 30,
    // ));

    if (duaWidgets == null || duaWidgets.isEmpty) {
      duaWidgets.add(SizedBox(
        width: 108,
        height: 30,
      ));
    }
    return duaWidgets;
  }
}

class CurvePainter extends CustomPainter {
  final double? angle;
  final List<Color>? colors;

  CurvePainter({this.colors, this.angle = 140});

  @override
  void paint(Canvas canvas, Size size) {
    List<Color> colorsList = [];
    if (colors != null) {
      colorsList = colors ?? [];
    } else {
      colorsList.addAll([Colors.white, Colors.white]);
    }

    final shdowPaint = new Paint()
      ..color = Colors.black.withOpacity(0.4)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    final shdowPaintCenter = new Offset(size.width / 2, size.height / 2);
    final shdowPaintRadius =
        math.min(size.width / 2, size.height / 2) - (14 / 2);
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.3);
    shdowPaint.strokeWidth = 16;
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.2);
    shdowPaint.strokeWidth = 20;
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.1);
    shdowPaint.strokeWidth = 22;
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    final rect = new Rect.fromLTWH(0.0, 0.0, size.width, size.width);
    final gradient = new SweepGradient(
      startAngle: degreeToRadians(268),
      endAngle: degreeToRadians(270.0 + 360),
      tileMode: TileMode.repeated,
      colors: colorsList,
    );
    final paint = new Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round // StrokeCap.round is not recommended.
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    final center = new Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2) - (14 / 2);

    canvas.drawArc(
        new Rect.fromCircle(center: center, radius: radius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        paint);

    final gradient1 = new SweepGradient(
      tileMode: TileMode.repeated,
      colors: [Colors.white, Colors.white],
    );

    var cPaint = new Paint();
    cPaint..shader = gradient1.createShader(rect);
    cPaint..color = Colors.white;
    cPaint..strokeWidth = 14 / 2;
    canvas.save();

    final centerToCircle = size.width / 2;
    canvas.save();

    canvas.translate(centerToCircle, centerToCircle);
    canvas.rotate(degreeToRadians(angle! + 2));

    canvas.save();
    canvas.translate(0.0, -centerToCircle + 14 / 2);
    canvas.drawCircle(new Offset(0, 0), 14 / 5, cPaint);

    canvas.restore();
    canvas.restore();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  double degreeToRadians(double degree) {
    var redian = (math.pi / 180) * degree;
    return redian;
  }
}
