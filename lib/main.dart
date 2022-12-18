import 'package:ayath_prayer_new/data/dua_item.dart';
import 'package:ayath_prayer_new/data/dua_name_item.dart';
import 'package:ayath_prayer_new/dua_page.dart';
import 'package:ayath_prayer_new/swipable_prayer_list.dart';
import 'package:ayath_prayer_new/persistence_sql.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data/dua_category_item.dart' show DuaCatergoryItem, DuaCatergoryItemAdapter;
import 'data/dua_name_item.dart' show DuaNameItem, DuaNameItemAdapter;
import 'data/dua_item.dart' show DuaItem, DuaItemAdapter;

import 'ExpansionTileExample.dart';
import 'data/user_count_with_favourite.dart';
import 'fitness_app_theme.dart';

const kHiveFolder = 'hive';
const kHiveBoxName = 'todosBox';

void main() async  {

  await Hive.initFlutter();
  Hive.registerAdapter(DuaCatergoryItemAdapter());
  Hive.registerAdapter(DuaNameItemAdapter());
  Hive.registerAdapter(DuaItemAdapter());
  Hive.registerAdapter(UserCountWithFavouriteAdapter());
  await Hive.openBox<DuaCatergoryItem>(kHiveBoxName);
  await Hive.openBox<UserCountWithFavourite>("countWithDuaBox");
  final box = Hive.box<DuaCatergoryItem>(kHiveBoxName);
  box.deleteFromDisk();

  await Hive.initFlutter();
  //Hive.registerAdapter(TodoItemAdapter());
  await Hive.openBox<DuaCatergoryItem>(kHiveBoxName);

  await  _getTodoItems();


  runApp(const MyApp());
}

Future<void> _addTodoItem(DuaCatergoryItem todo) async {
  final box = Hive.box<DuaCatergoryItem>(kHiveBoxName);
  final int key = await box.add(todo);
  // Set the id field to the auto-incremented key.
  todo.id = key;
  await todo.save();
  print('Inserted: key=$key, value=$todo');
}

_getTodoItems() async{

    await _addTodoItem(
      DuaCatergoryItem(
        name: 'aa1',
        duaNameList: [
         DuaNameItem(name: "new dua", duaList: [
           DuaItem(
               arabic: " part if dua s wu whsjd u kkotrber fucvkeb",
               translation: "nakyua dlam trab dlastuioi  ogf ud i moynet fu ncu",
               count: 10,
           )
         ], time: 10)
        ],
        time: 10,
        totalDua: 10,
      ),
    );
    await _addTodoItem(
      DuaCatergoryItem(
        name: 'aa2',
        duaNameList: [
          DuaNameItem(name: "new dua", duaList: [
            DuaItem(
              arabic: " part if dua s wu whsjd u kkotrber fucvkeb",
              translation: "nakyua dlam trab dlastuioi  ogf ud i moynet fu ncu",
              count: 10,
            )
          ], time: 10)
        ],
        time: 10,
        totalDua: 10,
      ),
    );
    await _addTodoItem(
      DuaCatergoryItem(
        name: 'aa3',
        duaNameList: [
          DuaNameItem(name: "new dua", duaList: [
            DuaItem(
              arabic: " part if dua s wu whsjd u kkotrber fucvkeb",
              translation: "nakyua dlam trab dlastuioi  ogf ud i moynet fu ncu",
              count: 10,
            )
          ], time: 10)
        ],
        time: 10,
        totalDua: 10,
      ),
    );
    await _addTodoItem(
      DuaCatergoryItem(
        name: 'aa4',
        duaNameList: [
          DuaNameItem(name: "new dua", duaList: [
            DuaItem(
              arabic: " part if dua s wu whsjd u kkotrber fucvkeb",
              translation: "nakyua dlam trab dlastuioi  ogf ud i moynet fu ncu",
              count: 10,
            )
          ], time: 10)
        ],
        time: 10,
        totalDua: 10,
      ),
    );






  final box = Hive.box<DuaCatergoryItem>(kHiveBoxName);
  final List<DuaCatergoryItem> todos = box.values.toList();
  print('Hive initialization done, todo items in the db are:');
  todos.forEach(print);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Color.fromRGBO(58, 66, 86, 1.0), fontFamily: 'Raleway',
        //primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  final topAppBar = AppBar(
    elevation: 0.8,
    backgroundColor: Colors.white, //.fromRGBO(58, 66, 86, 1.0),
    title: Text("Prayers",
        style: TextStyle(
          color: Color(0x80006400),
        )),
    actions: <Widget>[
      IconButton(
        icon: Icon(
          Icons.list,
          color: Color(0x80006400),
        ),
        onPressed: () {},
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return FutureBuilder<bool>(
        future: Future.value(true),//initDbFuture,
        builder: (context, snapshot) {
          print(snapshot);
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.red)
            );

          }
          return Scaffold(
            backgroundColor: Colors.white, //.fromRGBO(58, 66, 86, 1.0),
            appBar: topAppBar,
            // WatchBoxBuilder by hive_flutter can save us from writing a
            // StreamBuilder ourselves.
               body: ValueListenableBuilder<Box<DuaCatergoryItem>>(
               valueListenable: Hive.box<DuaCatergoryItem>(kHiveBoxName).listenable(),
                 builder: (context, box, _) => ListView(
                   children: <Widget>[
                     for (DuaCatergoryItem item in box.values)
                       _itemToListTile(item,context)
                   ],
                 ),
               ),
            // floatingActionButton: _buildFloatingActionButton(),
          );
        }
    );


    //   Scaffold(
    //   backgroundColor: Colors.white, //.fromRGBO(58, 66, 86, 1.0),
    //   appBar: topAppBar,
    //   body: ListView.builder(
    //     itemBuilder: (BuildContext context, int index) =>
    //         EntryItem(context, data[index]),
    //     itemCount: data.length,
    //   ),
    // );
    //SwipablePrayerList(widget: widget);
  }
}



//
//
// class SwipablePrayerList extends StatelessWidget {
//   const SwipablePrayerList({
//     Key? key,
//     required this.widget,
//   }) : super(key: key);
//
//   final MyHomePage widget;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: DefaultTabController(
//           length: kIcons.length,
//           // Use a Builder here, otherwise `DefaultTabController.of(context)` below
//           // returns null.
//           child: Builder(
//             builder: (BuildContext context) => Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: <Widget>[
//                   //const TabPageSelector(),
//                   Expanded(
//                     child: IconTheme(
//                       data: IconThemeData(
//                         size: 128.0,
//                         color: Theme.of(context).colorScheme.secondary,
//                       ),
//                       child: const TabBarView(children: kIcons),
//                     ),
//                   ),
//                   // ElevatedButton(
//                   //   onPressed: () {
//                   //     final TabController controller =
//                   //     DefaultTabController.of(context)!;
//                   //     if (!controller.indexIsChanging) {
//                   //       controller.animateTo(kIcons.length - 1);
//                   //     }
//                   //   },
//                   //   child: const Text('SKIP'),
//                   // )
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }


Widget _itemToListTile(DuaCatergoryItem todo,BuildContext context) {

  print(todo.duaNameList);

  return Material(
    elevation: 14.0,
    borderRadius: BorderRadius.circular(12.0),
    shadowColor: Colors.red,
    child: InkWell(
      child: Column(
        children: [
          ExpansionTile(
            tilePadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
                padding: const EdgeInsets.only(right: 12.0),
                decoration: const BoxDecoration(
                    border: Border(
                        right: BorderSide(
                            width: 1.0, color: Color(0x80006400)))),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  verticalDirection: VerticalDirection.down,
                  direction: Axis.vertical,
                  children: const [
                    Icon(Icons.punch_clock_outlined,
                        color: Color(0x80006400)),
                    Text('10 min')
                  ],
                )),
            //expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
            expandedAlignment: Alignment.center,
            backgroundColor: Color(0x8090ee90),
            collapsedBackgroundColor: Colors.white,
            subtitle: Row(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Container(
                      // tag: 'hero',
                      child: const LinearProgressIndicator(
                          backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                          value: 0.15,
                          semanticsValue: "6",
                          valueColor: AlwaysStoppedAnimation(Colors.green)),
                    )),
                Expanded(
                  flex: 4,
                  child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text('10 duas',
                          style: TextStyle(color: Colors.green))),
                )
              ],
            ),

            // iconColor: Colors.black12,
            // collapsedBackgroundColor: Colors.lightGreen,
            //initiallyExpanded: true,
            trailing: Icon(
              Icons.favorite,
              color: Color(0x8090ee90),
            ),
            //leading: Icon(Icons.ac_unit,size: 50,),
            key: PageStorageKey<DuaCatergoryItem>(todo),
            title: Center(
              child: Text(
                todo.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FitnessAppTheme.fontName,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  letterSpacing: -0.1,
                  color: FitnessAppTheme.grey.withOpacity(1.0),
                ),
              ),
            ),
            children: _getChildTodo(todo,context),
          ),
          const Divider(
            color: Color(0x8090ee90),
            thickness: 2,
            height: 1,
          )
        ],
      ),
    ),
  );

  //
  // return Material(
  //   borderOnForeground: true,
  //   elevation: 60.0,
  //   borderRadius: BorderRadius.circular(12.0),
  //   shadowColor: Color(0x802196F3),
  //   color: Colors.black12,
  //   child: Column(
  //     children: [
  //       ListTile(
  //         contentPadding:
  //         const EdgeInsets.symmetric(horizontal: 20.0, vertical: 3.0),
  //         title: const Text(
  //           "lesson.title",
  //           textAlign: TextAlign.center,
  //           style: TextStyle(
  //             color: Colors.white,
  //           ),
  //         ),
  //         onTap: () => {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //                 builder: (context) => SwipablePrayerList()),
  //           )
  //         },
  //       ),
  //       const Divider(
  //         color: Color(0x8090ee90),
  //         thickness: 1,
  //         height: 0,
  //       )
  //     ],
  //   ),
  // );

  // return ListTile(
  //
  //
  //   title: Text(
  //     todo.name,
  //     style: TextStyle(
  //
  //       color:Colors.grey ,
  //       decoration: todo.isDone ? TextDecoration.lineThrough : null,
  //     ),
  //   ),
  //   subtitle: Text('id=${todo.id}\ncreated at ${todo.createdAt}'),
  //   isThreeLine: true,
  //   // leading: IconButton(
  //   //   icon: Icon(
  //   //     todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
  //   //   ),
  //   //   //onPressed: () => _toggleTodoItem(todo),
  //   // ),
  //   // trailing: IconButton(
  //   //   icon: const Icon(Icons.delete),
  //   //  // onPressed: () => _deleteTodoItem(todo),
  //   // ),
  // );
}

_getChildTodo(DuaCatergoryItem dcitem, BuildContext context) {
  List<Widget> list = [];
  for (DuaNameItem item in dcitem.duaNameList){
    list.add(
        Material(
          borderOnForeground: true,
          elevation: 60.0,
          borderRadius: BorderRadius.circular(12.0),
          shadowColor: Color(0x802196F3),
          color: Colors.black12,
          child: Column(
            children: [
              ListTile(
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 3.0),
                title: Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () => {
                  if(item.duaList.isNotEmpty){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SwipablePrayerList(items: item.duaList,childItemId: item.id)),
                    )
                  }

                },
              ),
              const Divider(
                color: Color(0x8090ee90),
                thickness: 1,
                height: 0,
              )
            ],
          ),
        ),
    );
  }
  return list;
}

// One entry in the multilevel list displayed by this app.
class Entry {
  const Entry(this.title,
      {this.id,
      this.count,
      this.time,
      this.isFavourite,
      this.sectionId,
      this.children = const <Entry>[]});
  final String title;
  final int? id;
  final int? count;
  final int? time;
  final bool? isFavourite;
  final int? sectionId;
  final List<Entry> children;
}

// Data to display.
const List<Entry> data = <Entry>[
  Entry(
    'dance kalikkumbol chellendath',
    children: <Entry>[
      // Entry(
      //   'Section A0',
      //   <Entry>[
      //     Entry('Item A0.1'),
      //     Entry('Item A0.2'),
      //   ],
      // ),
      Entry('Section A1'),
      Entry('Section A2'),
    ],
  ),
  Entry(
    'hola vamos percepitos iallamnuall  B',
    children: <Entry>[
      Entry('Section B0'),
      Entry('Section B1'),
    ],
  ),
  Entry(
    'dance kalikkumbol chellendath',
    children: <Entry>[
      // Entry(
      //   'Section A0',
      //   <Entry>[
      //     Entry('Item A0.1'),
      //     Entry('Item A0.2'),
      //   ],
      // ),
      Entry('Section A1'),
      Entry('Section A2'),
    ],
  ),
  Entry(
    'hola vamos percepitos iallamnuall  B',
    children: <Entry>[
      Entry('Section B0'),
      Entry('Section B1'),
    ],
  ),
  Entry(
    'dance kalikkumbol chellendath',
    children: <Entry>[
      // Entry(
      //   'Section A0',
      //   <Entry>[
      //     Entry('Item A0.1'),
      //     Entry('Item A0.2'),
      //   ],
      // ),
      Entry('Section A1'),
      Entry('Section A2'),
    ],
  ),
  Entry(
    'hola vamos percepitos iallamnuall  B',
    children: <Entry>[
      Entry('Section B0'),
      Entry('Section B1'),
    ],
  ),
  Entry(
    'dance kalikkumbol chellendath',
    children: <Entry>[
      // Entry(
      //   'Section A0',
      //   <Entry>[
      //     Entry('Item A0.1'),
      //     Entry('Item A0.2'),
      //   ],
      // ),
      Entry('Section A1'),
      Entry('Section A2'),
    ],
  ),
  Entry(
    'hola vamos percepitos iallamnuall  B',
    children: <Entry>[
      Entry('Section B0'),
      Entry('Section B1'),
    ],
  ),
  Entry(
    'dance kalikkumbol chellendath',
    children: <Entry>[
      // Entry(
      //   'Section A0',
      //   <Entry>[
      //     Entry('Item A0.1'),
      //     Entry('Item A0.2'),
      //   ],
      // ),
      Entry('Section A1'),
      Entry('Section A2'),
    ],
  ),
  Entry(
    'hola vamos percepitos iallamnuall  B',
    children: <Entry>[
      Entry('Section B0'),
      Entry('Section B1'),
    ],
  ),
  Entry(
    'dance kalikkumbol chellendath',
    children: <Entry>[
      // Entry(
      //   'Section A0',
      //   <Entry>[
      //     Entry('Item A0.1'),
      //     Entry('Item A0.2'),
      //   ],
      // ),
      Entry('Section A1'),
      Entry('Section A2'),
    ],
  ),
  Entry(
    'hola vamos percepitos iallamnuall  B',
    children: <Entry>[
      Entry('Section B0'),
      Entry('Section B1'),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  final BuildContext context;

  const EntryItem(this.context, this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return 
        Material(
        borderOnForeground: true,
        elevation: 60.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        color: Colors.black12,
        child: Column(
          children: [
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 3.0),
              title: const Text(
                "lesson.title",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              // onTap: () => {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => SwipablePrayerList()),
              //   )
              // },
            ),
            const Divider(
              color: Color(0x8090ee90),
              thickness: 1,
              height: 0,
            )
          ],
        ),
      );
    }
    return Material(
      elevation: 14.0,
      borderRadius: BorderRadius.circular(12.0),
      shadowColor: Colors.red,
      child: InkWell(
        child: Column(
          children: [
            ExpansionTile(
              tilePadding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: Container(
                  padding: const EdgeInsets.only(right: 12.0),
                  decoration: const BoxDecoration(
                      border: Border(
                          right: BorderSide(
                              width: 1.0, color: Color(0x80006400)))),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    verticalDirection: VerticalDirection.down,
                    direction: Axis.vertical,
                    children: const [
                      Icon(Icons.punch_clock_outlined,
                          color: Color(0x80006400)),
                      Text('10 min')
                    ],
                  )),
              //expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
              expandedAlignment: Alignment.center,
              backgroundColor: Color(0x8090ee90),
              collapsedBackgroundColor: Colors.white,
              subtitle: Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Container(
                        // tag: 'hero',
                        child: const LinearProgressIndicator(
                            backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                            value: 0.15,
                            semanticsValue: "6",
                            valueColor: AlwaysStoppedAnimation(Colors.green)),
                      )),
                  Expanded(
                    flex: 4,
                    child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text('10 duas',
                            style: TextStyle(color: Colors.green))),
                  )
                ],
              ),

              // iconColor: Colors.black12,
              // collapsedBackgroundColor: Colors.lightGreen,
              //initiallyExpanded: true,
              trailing: Icon(
                Icons.favorite,
                color: Color(0x8090ee90),
              ),
              //leading: Icon(Icons.ac_unit,size: 50,),
              key: PageStorageKey<Entry>(root),
              title: Center(
                child: Text(
                  root.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: FitnessAppTheme.fontName,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    letterSpacing: -0.1,
                    color: FitnessAppTheme.grey.withOpacity(1.0),
                  ),
                ),
              ),
              children: root.children.map(_buildTiles).toList(),
            ),
            const Divider(
              color: Color(0x8090ee90),
              thickness: 2,
              height: 1,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
