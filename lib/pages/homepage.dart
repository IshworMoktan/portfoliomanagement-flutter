import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:portfoliomanagement/pages/stocklist.dart';
import 'package:flutter/animation.dart';
import 'package:portfoliomanagement/pages/buypage.dart';
import 'package:portfoliomanagement/provider/google_sign_in.dart';
import 'package:portfoliomanagement/widget/login_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  //buying stock dialog form
  Future<void> showBuyPage(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        final TextEditingController stocknameEditingController =
            TextEditingController();
        final TextEditingController quantityEditingController =
            TextEditingController();
        final TextEditingController buyingPriceEditingController =
            TextEditingController();
        return AlertDialog(
          content: Form(
            key: _formkey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: stocknameEditingController,
                  validator: (value) {
                    return value!.isNotEmpty ? null : "Invalid Field";
                  },
                  decoration: const InputDecoration(
                      label: Text("Stockname"),
                      hintText: "Enter your stock name"),
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
        final TextEditingController stocknameEditingController =
            TextEditingController();
        final TextEditingController quantityEditingController =
            TextEditingController();
        final TextEditingController sellingPriceEditingController =
            TextEditingController();
        return AlertDialog(
          content: Form(
            key: _formkey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: stocknameEditingController,
                  validator: (value) {
                    return value!.isNotEmpty ? null : "Invalid Field";
                  },
                  decoration: const InputDecoration(
                      label: Text("Stockname"),
                      hintText: "Enter your stock name"),
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
                  controller: sellingPriceEditingController,
                  validator: (value) {
                    return value!.isNotEmpty ? null : "Invalid Field";
                  },
                  decoration: const InputDecoration(
                      label: Text("Buying price"), hintText: "Rs.120000"),
                ),
              ],
            ),
          ),

          // Buying button
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
              ),
              child: const Text('Sell'),
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  Navigator.of(context).pop();
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

    final user = FirebaseAuth.instance.currentUser;

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
                    MaterialPageRoute(builder: (context) => const HomePage()),
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
                    MaterialPageRoute(builder: (context) => const Stocklist()),
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
                          final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                          provider.logout();
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
                      'user: ${user?.displayName}',
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

              //Stocks

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      child: const Text(
                        " Portfolio",
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
            ],
          ),
        ),
      ),
    );
  }
}
