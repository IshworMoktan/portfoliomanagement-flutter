import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:portfoliomanagement/pages/stocklist.dart';
import 'package:flutter/animation.dart';
import 'package:portfoliomanagement/pages/transactionpage.dart';
import 'package:portfoliomanagement/pages/loginpage.dart';

import '../auth_service.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final CollectionReference _transactions =
      FirebaseFirestore.instance.collection('transactions');
  final CollectionReference _stocks =
      FirebaseFirestore.instance.collection('stocks');

  var selectedStock;
  // TextEditingController selectedStock = TextEditingController();
  final TextEditingController quantityEditingController =
      TextEditingController();
  final TextEditingController buyingPriceEditingController =
      TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  //buying stock dialog form
  Future<void> showBuyPage(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        //adding buy function
        Future<void> addBuy() {
          return _transactions
              .add({
                'StockName': selectedStock,
                'Quantity': quantityEditingController.text,
                'StockPrice': buyingPriceEditingController.text,
                'uid': FirebaseAuth.instance.currentUser!.uid!,
                'TransactionDate': DateTime.now(),
                'TransactionType': 'Buy',
              })
              .then((value) => print('Stock purchased'))
              .catchError((error) => print('Failed to purchase: $error'));
        }



        return AlertDialog(
          content: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //dropdown stock name menu
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("stocknames")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        Text("Loading");
                      } else {
                        List<DropdownMenuItem> stocknameslist = [];
                        for (int i = 0; i < snapshot.data!.docs.length; i++) {
                          DocumentSnapshot snap = snapshot.data!.docs[i];

                          stocknameslist.add(
                            DropdownMenuItem(
                              child: Text(
                                snap.id,
                                style: TextStyle(color: Colors.green),
                              ),
                              value: "${snap.id}",
                            ),
                          );
                        }

                        return DropdownButtonFormField(
                          items: stocknameslist,
                          onChanged: (StockNameValue) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Selected stockname is $StockNameValue",
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                            );
                            setState(
                              () {
                                selectedStock = StockNameValue;
                              },
                            );
                          },
                          isExpanded: false,
                          value: selectedStock,
                          hint: Text(
                            "Choose stockname",
                            style: TextStyle(
                              color: Color(0xff11b719),
                            ),
                          ),
                        );
                      }
                      return SizedBox.shrink();
                    },
                  ),

                  TextFormField(
                    controller: quantityEditingController,
                    validator: (value) {
                      return value!.isNotEmpty ? null : "Invalid Field";
                    },
                    decoration: const InputDecoration(
                        label: Text("Quantity"), hintText: "10-10000"),
                  ),
                  TextFormField(
                    controller: buyingPriceEditingController,
                    validator: (value) {
                      return value!.isNotEmpty ? null : "Invalid Field";
                    },
                    decoration: const InputDecoration(
                        label: Text("Buying price"), hintText: "Rs.120000"),
                  ),
                ],
              ),
            ),
          ),

          // Buying button
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.teal,
              ),
              child: const Text('Buy'),
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  Navigator.of(context).pop();
                  addBuy();
                }
              },
            ),
          ],
        );
      },
    );
  }

  //selling stock dialog form

  Future<void> showSellPage(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        //adding sell function
        Future<void> addSell() {
          return _transactions
              .add({
                'StockName': selectedStock,
                'Quantity': quantityEditingController.text,
                'StockPrice': buyingPriceEditingController.text,
                'uid': FirebaseAuth.instance.currentUser!.uid!,
                'TransactionDate': DateTime.now(),
                'TransactionType': 'Sell',
              })
              .then((value) => print('Stock sold'))
              .catchError((error) => print('Failed to purchase: $error'));
        }

        return AlertDialog(
          content: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //dropdown stock name menu
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("stocknames")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        Text("Loading");
                      } else {
                        List<DropdownMenuItem> stocknameslist = [];
                        for (int i = 0; i < snapshot.data!.docs.length; i++) {
                          DocumentSnapshot snap = snapshot.data!.docs[i];

                          stocknameslist.add(
                            DropdownMenuItem(
                              child: Text(
                                snap.id,
                                style: TextStyle(color: Colors.green),
                              ),
                              value: "${snap.id}",
                            ),
                          );
                        }

                        return DropdownButtonFormField(
                          items: stocknameslist,
                          onChanged: (StockNameValue) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Selected stockname is $StockNameValue",
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                            );
                            setState(
                              () {
                                selectedStock = StockNameValue;
                              },
                            );
                          },
                          isExpanded: false,
                          value: selectedStock,
                          hint: Text(
                            "Choose stockname",
                            style: TextStyle(
                              color: Color(0xff11b719),
                            ),
                          ),
                        );
                      }
                      return SizedBox.shrink();
                    },
                  ),

                  TextFormField(
                    controller: quantityEditingController,
                    validator: (value) {
                      return value!.isNotEmpty ? null : "Invalid Field";
                    },
                    decoration: const InputDecoration(
                        label: Text("Quantity"), hintText: "10-10000"),
                  ),
                  TextFormField(
                    controller: buyingPriceEditingController,
                    validator: (value) {
                      return value!.isNotEmpty ? null : "Invalid Field";
                    },
                    decoration: const InputDecoration(
                        label: Text("Selling price"), hintText: "Rs.120000"),
                  ),
                ],
              ),
            ),
          ),

          // Buying button
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.teal,
              ),
              child: const Text('Sell'),
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  Navigator.of(context).pop();
                  addSell();
                }
              },
            ),
          ],
        );
      },
    );
  }

  Animation<double>? _animation;
  AnimationController? _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.bounceOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionBubble(
        items: <Bubble>[
          Bubble(
            title: "Buy",
            iconColor: Colors.white,
            bubbleColor: Colors.green,
            icon: Icons.money_rounded,
            titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
            onPress: () async {
              await showBuyPage(context);
              _animationController!.reverse();
            },
          ),
          Bubble(
            title: "Sell",
            iconColor: Colors.white,
            bubbleColor: Colors.red,
            icon: Icons.money_rounded,
            titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
            onPress: () async {
              await showSellPage(context);
              _animationController!.reverse();
            },
          ),
        ],
        animation: _animation!,
        onPress: () => _animationController!.isCompleted
            ? _animationController!.reverse()
            : _animationController!.forward(),
        backGroundColor: Colors.blueAccent,
        iconColor: Colors.white,
        iconData: Icons.add,
      ),
      bottomNavigationBar: BottomAppBar(
        //bottom navigation bar on scaffold
        color: Colors.white38,
        shape: const CircularNotchedRectangle(), //shape of notch
        notchMargin:
            5, //notche margin between floating button and bottom appbar
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: IconButton(
                icon: const Icon(
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
              padding: const EdgeInsets.only(right: 50, left: 50),
              child: IconButton(
                icon: const Icon(
                  Icons.currency_exchange,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TransactionPage()),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: IconButton(
                icon: const Icon(
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
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    const Text(
                      "Welcome back",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 155),
                      child: TextButton(
                        onPressed: () {
                          AuthService().disconnect();
                          AuthService().signOut();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        child: const Text('SignOut'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      FirebaseAuth.instance.currentUser!.displayName!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(
                      Icons.verified_user_sharp,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
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
                      const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      const Text(
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
              const SizedBox(
                height: 20,
              ),

              //Dashboard

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      child: const Text(
                        " Dashboard",
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

              const SizedBox(height: 20),

              //Totalunits

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Total units: ",
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
                                    "2000",
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
                      //Sold amount
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
                                    "2000",
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
                      //Overall Profit
                      Row(
                        children: [
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Overall Profit :",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
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
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
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
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Total investment : ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "2000",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
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
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Current Amount : ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "2000",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
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
            ],
          ),
        ),
      ),
    );
  }
}
