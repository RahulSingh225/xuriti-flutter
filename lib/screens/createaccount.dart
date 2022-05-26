import 'package:flutter/material.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Row(children: [
              Container(
                  height: double.infinity,
                  child: Stack(
                    children: <Widget>[
                      AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset(
                            'assets/images/bg.jpg',
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width / 2,
                            alignment: Alignment.center,
                          )),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                            child: Image.asset(
                              'assets/images/logo.jpg',
                              height: 100,
                              width: 200,
                            ),
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 5,
                            ),
                          ))
                    ],
                  )),
              VerticalDivider(
                color: Color.fromARGB(216, 0, 0, 0),
                thickness: 1,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text("LOGIN",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 36)),
                        Text("Login to continue to: Your Dashboard",
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ])
            ])));
  }
}
