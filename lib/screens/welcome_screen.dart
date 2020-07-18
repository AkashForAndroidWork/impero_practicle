import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:impero_practicle/screens/dash_board_screen.dart';
import 'package:impero_practicle/screens/test_strip_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        margin: const EdgeInsets.all(25),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => DashBoardScreen()));
                },
                child: Text("Go tp ESP Tiles", style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: Colors.white
                ),),
              ),
              Container(height: 16),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => TestStripScreen()));
                },
                child: Text("Go tp Test Strip", style: Theme.of(context).textTheme.bodyText2.copyWith(
                    color: Colors.white
                ),),
              )
            ],
          ),
        ),
      )),
    );
  }
}
