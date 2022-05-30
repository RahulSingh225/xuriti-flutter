// ignore_for_file: prefer_const_constructors, unnecessary_import

import 'package:flutt_app/widgets/loginform.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 720) {
            return MobLayout(context);
          } else {
            return WebLayout(context);
          }
        },
      ),
    );
  }

  Widget MobLayout(context) {
    return SingleChildScrollView(
      child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Stack(
                    children: <Widget>[
                      AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset(
                            'assets/images/bg.jpg',
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height / 2,
                            width: MediaQuery.of(context).size.width / 2,
                            alignment: Alignment.center,
                          )),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width * 0.5,
                            alignment: Alignment.topCenter,
                            child: Expanded(
                              child: Image.asset(
                                'assets/images/logo.jpg',
                              ),
                            ),
                          ))
                    ],
                  )),
              Divider(
                color: Color.fromARGB(216, 0, 0, 0),
                thickness: 1,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                      child: MyCustomForm(),
                      width: MediaQuery.of(context).size.width - 100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: (() =>
                              // Within the `FirstRoute` widget
                              {Navigator.pushNamed(context, '/createaccount')}),
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                      Padding(padding: EdgeInsets.only(bottom: 50))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 24,
                        width: 72,
                        child: Image.asset(
                          "assets/images/logo_small.jpg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      VerticalDivider(
                        thickness: 2,
                        color: Colors.deepOrange,
                      ),
                      SizedBox(
                        height: 40,
                        width: 180,
                        child: Text(
                          "More than 500 merchants in your area are on Xuriti.",
                          style: TextStyle(fontSize: 14),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }

  Widget WebLayout(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Row(
          children: [
            Container(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: <Widget>[
                    AspectRatio(
                        aspectRatio: 1,
                        child: Image.asset(
                          'assets/images/bg.jpg',
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width / 2,
                          alignment: Alignment.center,
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Expanded(
                            child: Image.asset(
                              'assets/images/logo.jpg',
                            ),
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
                SizedBox(
                    child: MyCustomForm(),
                    width: MediaQuery.of(context).size.width / 2 - 100),
                Row(
                  children: [
                    Text(
                      "Don't have an account?",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: (() =>
                            // Within the `FirstRoute` widget
                            {Navigator.pushNamed(context, '/createaccount')}),
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 24,
                      width: 72,
                      child: Image.asset(
                        "assets/images/logo_small.jpg",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    VerticalDivider(
                      thickness: 2,
                      color: Colors.deepOrange,
                    ),
                    SizedBox(
                      height: 40,
                      width: 180,
                      child: Text(
                        "More than 500 merchants in your area are on Xuriti.",
                        style: TextStyle(fontSize: 14),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ));
  }
}
