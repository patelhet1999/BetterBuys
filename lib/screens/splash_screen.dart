import 'dart:async';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:better_buys/server_handler.dart';

import 'package:better_buys/screens/sellers_screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool showLoadingSellers = false;
  late Timer _timer;

  void getSellers() {
    ServerHandler().getSellers().then((value) => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SellersScreen(sellers: value,)))).catchError((e)=> print(e));
  }

  @override
  void initState(){
    super.initState();

    _timer = new Timer(Duration(seconds: 3,), () {
      getSellers();
      setState((){
        showLoadingSellers = true;
      });
    },);
  }

  @override
  void dispose(){
    _timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.grey.shade300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Better Boys",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 27,
              ),
            ),

            if(showLoadingSellers)
            SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff4E8489)),
                strokeWidth: 1.5,
              ),
            ),

            if(showLoadingSellers)
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text("Loading Sellers"),
            ),

          ],
        ),

      ),
    );
  }
}


