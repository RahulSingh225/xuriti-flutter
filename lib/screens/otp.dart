import 'package:flutt_app/widgets/otpform.dart';
import 'package:flutter/material.dart';

class OTP extends StatelessWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
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
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 5,
                            ),
                            child: Image.asset(
                              'assets/images/logo.jpg',
                              height: 100,
                              width: 200,
                            ),
                          ))
                    ],
                  )),
              const VerticalDivider(
                color: Color.fromARGB(216, 0, 0, 0),
                thickness: 1,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: (() => Navigator.pop(context)),
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.deepOrange,
                                )),
                            const Text("Enter OTP",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 36)),
                          ],
                        ),
                        const Text("We have sent an OTP on your 84XXXXXX98",
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width / 2 - 100,
                        child: const OTPForm()),
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
                        const VerticalDivider(
                          thickness: 2,
                          color: Colors.deepOrange,
                        ),
                        const SizedBox(
                          height: 40,
                          width: 180,
                          child: Text(
                            "More than 500 merchants in your area are on Xuriti.",
                            style: TextStyle(fontSize: 14),
                          ),
                        )
                      ],
                    )
                  ])
            ])));
  }
}
