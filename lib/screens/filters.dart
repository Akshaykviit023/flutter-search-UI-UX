

import "package:my_app/constants/sub_filters.dart";
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/constants/colors.dart';
import 'package:vertical_tabs_flutter/vertical_tabs.dart';

class Filters extends StatelessWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Title',
      home: Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: const Padding( 
            padding: EdgeInsets.only(top: 20, left: 5),
            child:Text(
            'Filters',
            style: TextStyle(
              color: tdBlack,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          ),
          backgroundColor: tdBGColor,
          toolbarHeight: 80,
          actions: [
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                // Implement the logic to clear all filters
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0, top: 20.0),
                child: TextButton(
                  onPressed: () {
                    // Implement the logic to clear all filters
                  },
                  child: const Text(
                    'Clear All',
                    style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: VerticalTabs(
        selectedTabBackgroundColor: tdBGColor,
        tabBackgroundColor: tdMidGrey,
        indicatorWidth: 0,
        tabsWidth: 140,
        tabs: const <Tab>[
          
          Tab(
            
                      child: SizedBox(
                        height: 45,
                            child: Padding(
                          padding: EdgeInsets.only(left: 15, top: 12),
                          child: Text('Gender', style: TextStyle(fontSize: 15)),
                        ),
                          
                      ),
                      
                    ),

                    Tab(
                      child: SizedBox(
                        height: 45,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15, top: 12),
                          child: Text('Category', style: TextStyle(fontSize: 15)),
                        ),
                      ),
                      
                    ),

                    Tab(
                      child: SizedBox(
                        height: 45,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15, top: 12),
                          child: Text('Occassion', style: TextStyle(fontSize: 15)),
                        ),
                      ),
                    ),
         
         Tab(
                      child: SizedBox(
                        height: 45,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15, top: 12),
                          child: Text('Date', style: TextStyle(fontSize: 15)),
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        height: 45,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15, top: 12),
                          child: Text('Event type', style: TextStyle(fontSize: 15)),
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        height: 45,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15, top: 12),
                          child: Text('Listing type', style: TextStyle(fontSize: 15)),
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        height: 45,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15, top: 12),
                          child: Text('Colour', style: TextStyle(fontSize: 15)),
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        height: 45,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15, top: 12),
                          child: Text('Gender', style: TextStyle(fontSize: 15)),
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        height: 45,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15, top: 12),
                          child: Text('Category', style: TextStyle(fontSize: 15)),
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        height: 45,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15, top: 12),
                          child: Text('Occassion', style: TextStyle(fontSize: 15)),
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        height: 45,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15, top: 12),
                          child: Text('Date', style: TextStyle(fontSize: 15)),
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        height: 45,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15, top: 12),
                          child: Text('Event Type', style: TextStyle(fontSize: 15)),
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        height: 45,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15, top: 12),
                          child: Text('Listing type', style: TextStyle(fontSize: 15)),
                        ),
                      ),
                    ),
                    
        ],
        contents: <Widget>[
          tabsContent(
            gender,
          ),
          tabsContent(category),
          tabsContent(occasion),
          tabsContent(date),
          tabsContent(eventType),
          tabsContent(listingType),
          tabsContent(colour),
          tabsContent(
            gender,
          ),
          tabsContent(category),
          tabsContent(occasion),
          tabsContent(date),
          tabsContent(eventType),
          tabsContent(listingType),
        ],
      ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Go back to the previous screen
                },
                child: Material(
                  elevation: 15,
                  child: Container(
                    color: tdBGColor,
                    padding: const EdgeInsets.all(25),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(width: 10),
                        Text(
                          'APPLY FILTERS',
                          style: TextStyle(
                            color: tdBlack,
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
 Widget tabsContent(List<String> subFilters, [String description = '']) {
        return Container(
          padding: const EdgeInsets.only(top: 5, left: 20),
          color: tdBGColor,
          child: Column(
            children: <Widget>[
              for (var i = 0; i < subFilters.length; i++)
                SizedBox(
                  height: 45,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 12),
                    child: CheckIconExample(
                      text: subFilters[i],
                    ),
                  ),
                ),
            ],
          ),
        );
      }
    }
  

  class CheckIconExample extends StatefulWidget {
    final String text;

    const CheckIconExample({Key? key, required this.text}) : super(key: key);

    @override
    _CheckIconExampleState createState() => _CheckIconExampleState();
  }

  class _CheckIconExampleState extends State<CheckIconExample> {
    bool isChecked = false;

    @override
    Widget build(BuildContext context) {
      return InkWell(
        onTap: () {
          setState(() {
            isChecked = !isChecked;
          });
        },
        child: Row(
          children: [
            if (isChecked)
              const Icon(
                Icons.check,
                color: tdBlack,
                size: 18,
              ),
            const SizedBox(width: 12),
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isChecked ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      );
    }
  }
  