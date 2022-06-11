import 'package:flutter/material.dart';
import 'package:notepad/home.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[200],
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 160),
          child: Center(
            child: Image.asset("images/1.png"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: Text(
            " Welcome in my Note App ",
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: MaterialButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Home();
              }));
            },
            child: Text(
              " Let’s Go",
              style: TextStyle(fontSize: 30),
            ),
          ),
        )
      ]),
    );
  }
}
