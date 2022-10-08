import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

class Stocklist extends StatefulWidget {
  const Stocklist({Key? key}) : super(key: key);

  @override
  State<Stocklist> createState() => _StocklistState();
}

class _StocklistState extends State<Stocklist> with SingleTickerProviderStateMixin{

  Animation<double>? _animation;
  AnimationController? _animationController;
  @override

  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    final curvedAnimation =
    CurvedAnimation(curve: Curves.bounceOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1 ).animate(curvedAnimation);

    super.initState();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){},
      //   tooltip: 'Trade',
      //   child: const Icon(Icons.attach_money_rounded),
      //
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: FloatingActionBubble(

        items:<Bubble>[
          Bubble(
            title: "Buy",
            iconColor: Colors.white,
            bubbleColor: Colors.green,
            icon: Icons.money_rounded,
            titleStyle: TextStyle(fontSize: 16, color: Colors.white),
            onPress: (){
              _animationController!.reverse();
            },
          ),
          Bubble(
            title: "Sell",
            iconColor: Colors.white,
            bubbleColor: Colors.red,
            icon: Icons.money_rounded,
            titleStyle: TextStyle(fontSize: 16, color: Colors.white),
            onPress: (){
              _animationController!.reverse();
            },
          ),
        ],
        animation: _animation!,
        onPress: () => _animationController!.isCompleted? _animationController!.reverse():_animationController!.forward(),
        backGroundColor: Colors.blueAccent,
        iconColor: Colors.white,
        iconData: Icons.add,
      ),






      bottomNavigationBar: BottomAppBar(
        //bottom navigation bar on scaffold
        color: Colors.white38,
        shape: CircularNotchedRectangle(), //shape of notch
        notchMargin:
        5, //notche margin between floating button and bottom appbar
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 50),
              child: IconButton(
                icon: Icon(
                  Icons.dashboard,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: IconButton(
                icon: Icon(
                  Icons.inventory_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Stocklist()),
                  );
                },
              ),
            ),
          ],
        ),
      ),



      backgroundColor: Colors.black,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      " Stock List",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.inventory_rounded,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      Text(
                        "Search",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              // Individual stock list

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        " Stocks",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              //Stock list

              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(12),
                    ),

// Stock name
                    child: Column(
                      children: [
                        // Stock name
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("1.",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Nepal Bank Limited",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        //Total unit
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Total units :",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "2000",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        //Sold Amount
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Sold amount :",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "2000",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        //Overall Profit
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Overall Profit :",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "15000",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        //Total investment
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Total investment : ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "2000",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Current Amount
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Current Amount : ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "2000",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(12),
                    ),

// Stock name
                    child: Column(
                      children: [
                        // Stock name
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("2.",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Nepal Bank Limited",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        //Total unit
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Total units :",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "2000",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        //Sold Amount
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Sold amount :",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "2000",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        //Overall Profit
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Overall Profit :",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "15000",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        //Total investment
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Total investment : ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "2000",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Current Amount
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Current Amount : ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "2000",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(12),
                    ),

// Stock name
                    child: Column(
                      children: [
                        // Stock name
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("1.",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Nepal Bank Limited",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        //Total unit
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Total units :",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "2000",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        //Sold Amount
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Sold amount :",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "2000",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        //Overall Profit
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Overall Profit :",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "15000",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        //Total investment
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Total investment : ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "2000",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Current Amount
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Current Amount : ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "2000",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(12),
                    ),

// Stock name
                    child: Column(
                      children: [
                        // Stock name
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("1.",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Nepal Bank Limited",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        //Total unit
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Total units :",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "2000",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        //Sold Amount
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Sold amount :",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "2000",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        //Overall Profit
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Overall Profit :",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "15000",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        //Total investment
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Total investment : ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "2000",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Current Amount
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Current Amount : ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "2000",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(12),
                    ),

// Stock name
                    child: Column(
                      children: [
                        // Stock name
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("1.",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Nepal Bank Limited",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        //Total unit
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Total units :",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "2000",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        //Sold Amount
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Sold amount :",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "2000",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        //Overall Profit
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Overall Profit :",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "15000",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        //Total investment
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Total investment : ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "2000",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Current Amount
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Current Amount : ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "2000",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
}
