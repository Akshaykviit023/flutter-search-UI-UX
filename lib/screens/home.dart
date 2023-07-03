
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_app/constants/colors.dart';
import 'package:faker/faker.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:iconly/iconly.dart";

import 'filters.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final List<String> sortedBrands = List.generate(30, (_) => Faker().person.name()).toList()
      ..sort();
    final List<String> sortedStylists = List.generate(30, (_) => Faker().job.title()).toList()
      ..sort();
    final List<String> sortedSeasons = List.generate(30, (_) => Faker().animal.name()).toList()
      ..sort();

      var items1 = <String>[];
      var items2 = <String>[];
      var items3 = <String>[];

  int _selectedIndex = 0;
  late TabController _tabController;
  TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    items1 = sortedBrands;
    items2 = sortedStylists;
    items3 = sortedSeasons;

    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }
void filterSearchResults(String query) {
    setState(() {
      items1 = sortedBrands
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();

      items2 = sortedStylists
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();

      items3 = sortedSeasons
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    /*
    final Faker faker = Faker();
    final List<String> sortedBrands = List.generate(20, (_) => faker.person.name()).toList()
      ..sort();
    final List<String> sortedStylists = List.generate(20, (_) => faker.job.title()).toList()
      ..sort();
    final List<String> sortedSeasons = List.generate(20, (_) => faker.animal.name()).toList()
      ..sort();
*/
    return Scaffold(
      backgroundColor: tdBGColor,
      body: Column(
        children: [
          Material(
            elevation: 5,
            child: Column(
              children: [
          Container(
            color: tdBGColor,
            padding: const EdgeInsets.only(top: 54, left: 8,right: 8,bottom: 8),

          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: tdGrey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 0, right: 8),
                  child: Icon(
                    //Ionicons.search_outline,
                    IconlyLight.search,
                    color: tdBlack,
                    size: 16,
                  ),
                ),
                Expanded(
                  child: TextField(
                    cursorColor: tdBlack,
                    onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.only(top: 9, bottom: 10, right: 10),
                      border: InputBorder.none,
                      hintText: 'Search a Brand, Product, Stylist or Season',
                      hintStyle: TextStyle(color: tdDarkGrey, fontSize: 13),
                      isDense: true,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Filters()),
                    );
                  },
                  child: const Padding( 
                    padding: EdgeInsets.only(right: 5),
                    child: Icon(
                    
                    Ionicons.options_outline,
                    color: Colors.black,
                    size: 20,
                  ),
                  ),
                ),
              ],
            ),
          ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 0),
            child: Material(
              color: tdBGColor,
              child: TabBar(
                indicatorColor: tdBlack,
                controller: _tabController,
                tabs: [
                  Tab(
                    icon: Text(
                      'Brands',
                      style: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 15,
                        fontWeight: _tabController.index == 0
                            ? FontWeight.w600
                            : FontWeight.w400,
                        color: _tabController.index == 0
                            ? tdBlack
                            : tdDarkGrey,
                      ),
                    ),
                  ),
                  Tab(
                    icon: Text(
                      'Stylists',
                      style: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 15,
                        fontWeight: _tabController.index == 1
                            ? FontWeight.w600
                            : FontWeight.w400,
                        color: _tabController.index == 1
                            ? tdBlack
                            : tdDarkGrey,
                      ),
                    ),
                  ),
                  Tab(
                    icon: Text(
                      'Seasons',
                      style: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 15,
                        fontWeight: _tabController.index == 2
                            ? FontWeight.w600
                            : FontWeight.w400,
                        color: _tabController.index == 2
                            ? tdBlack
                            : tdDarkGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: items1.length,
                  itemBuilder: (context, index) {
                    // Check if the current item's starting letter is different from the previous item
                    if (index == 0 ||
                        items1[index][0] != items1[index - 1][0]) {
                      // Display a section header for the new letter
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 25,top: 25),
                            child: Text(
                              items1[index][0],
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 25, top: 10,bottom: 10),
                            child: Text(
                              items1[index],
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ) ,
                          ),
                          
                        ],
                      );
                    } else {
                      // Display a regular ListTile without a section header
                      return Container(
                            padding: const EdgeInsets.only(left: 25, top: 10,bottom:10),
                            child: Text(
                              items1[index],
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ) ,
                          );
                    }
                  },
                ),
                ListView.builder(
                  itemCount: items2.length,
                  itemBuilder: (context, index) {
                    // Check if the current item's starting letter is different from the previous item
                    if (index == 0 ||
                        items2[index][0] !=
                            items2[index - 1][0]) {
                      // Display a section header for the new letter
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 25,top: 25),
                            child: Text(
                              items2[index][0],
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 25, top: 10,bottom: 10),
                            child: Text(
                              items2[index],
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ) ,
                          ),
                          
                        ],
                      );
                    } else {
                      // Display a regular ListTile without a section header
                      return Container(
                            padding: const EdgeInsets.only(left: 25, top: 10,bottom:10),
                            child: Text(
                              items2[index],
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ) ,
                          );
                    }
                  },
                ),
                ListView.builder(
                  itemCount: items3.length,
                  itemBuilder: (context, index) {
                    // Check if the current item's starting letter is different from the previous item
                    if (index == 0 ||
                        items3[index][0] !=
                            items3[index - 1][0]) {
                      // Display a section header for the new letter
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 25,top: 25),
                            child: Text(
                              items3[index][0],
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 25, top: 10,bottom: 10),
                            child: Text(
                              items3[index],
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ) ,
                          ),
                          
                        ],
                      );
                    } else {
                      // Display a regular ListTile without a section header
                      return Container(
                            padding: const EdgeInsets.only(left: 25, top: 10,bottom:10),
                            child: Text(
                              items3[index],
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ) ,
                          );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        elevation: 5,
        label: Text(
          "Find what you're looking for",
          style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: tdBGColor),
        ),
        backgroundColor: tdOrange,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color.fromARGB(255, 126, 126, 126),
              blurRadius: 30,
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                IconlyLight.home
              , size: 20, color: tdDarkGrey),
              activeIcon: Icon(IconlyBold.home, size: 26),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                IconlyLight.search,
                  size: 20, color: tdDarkGrey),
              activeIcon: Icon(IconlyBold.search, size: 26),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                IconlyLight.document,
                  size: 20, color: tdDarkGrey),
              activeIcon: Icon(IconlyBold.document, size: 26),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                IconlyLight.profile,
                  size: 20, color: tdDarkGrey),
              activeIcon: Icon(IconlyBold.profile, size: 26),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.grey[400],
          onTap: _onItemTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(
            color: tdBlack,
            size: 30,
          ),
          unselectedIconTheme: const IconThemeData(
            color: tdBlack,
            size: 30,
          ),
        ),
      ),
    );
  }
}

