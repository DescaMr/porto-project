import 'package:flutter/material.dart';
import 'package:porto_project/ui/add_story_screen.dart';
import 'package:porto_project/ui/menu.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController pageController = PageController(initialPage: 0);
  late int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _appBar(),
      drawer: _drawer(context),
      // backgroundColor: Colors.white,
      extendBody: true,
      body: PageView(
        controller: pageController,
        children: const <Widget>[
          Center(
            child: AddStoryScreen(),
          ),
          Center(
            child: MenuPage(),
          ),
        ],
      ),
      floatingActionButton: _FAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _navbar(),
    );
  }

  BottomAppBar _navbar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6.0,
      // elevation: 0.5,
      height: 83,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        // height: kBottomNavigationBarHeight,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.red,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
              pageController.jumpToPage(index);
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.note_add_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_rounded),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  FloatingActionButton _FAB() {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
      tooltip: 'Add Status',
      backgroundColor: Colors.red,
      shape: const CircleBorder(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(
        'Komeng',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          _scaffoldKey.currentState!.openDrawer();
        },
        icon: Icon(Icons.menu),
        color: Colors.white,
      ),
      backgroundColor: Colors.red,
    );
  }

  Drawer _drawer(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Material(
                    color: Colors.red,
                    child: InkWell(
                      onTap: () {
                        /// Close Navigation drawer before
                        Navigator.pop(context);
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile()),);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top,
                            bottom: 24),
                        child: const Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 52,
                                backgroundImage: AssetImage('assets/bill.jpg'),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              'Kakek Perkasa',
                              style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'oldbutgold@gmail.com',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: Colors.blueGrey,
                    ),
                    title: const Text(
                      'A K U N',
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.settings,
                      color: Colors.blueGrey,
                    ),
                    title: const Text('P E N G A T U R A N',
                        style: TextStyle(color: Colors.blueGrey)),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                ],
              ),
            ),
          ),
          Divider(height: 1),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app,
              color: Colors.red,
            ),
            title:
                const Text('K E L U A R', style: TextStyle(color: Colors.red)),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Konfirmasi"),
                      content: Text("Apakah Anda yakin ingin keluar?"),
                      actions: [
                        OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Tidak",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        FilledButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Ya",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
