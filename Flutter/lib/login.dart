import 'package:flutter/material.dart';
import 'package:flutter_project/hello.dart';
import 'package:flutter_project/home_screen.dart';
import 'package:flutter_project/payment.dart';
import 'package:flutter_project/signUp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormScreen extends StatefulWidget {
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    final _formfield = GlobalKey<FormState>();
    bool _obsecureText = true;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/city.jpg'), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 90,
                height: 90,
                margin: EdgeInsets.only(top: 110),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/location.png'),
                )),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 50),
                  child: const Text(
                    "VISION GO ",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: SingleChildScrollView(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35)),
                      color: Colors.white,
                    ),
                    width: 400,
                    height: 500,
                    child: Padding(
                      padding: const EdgeInsets.all(50),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Login Here ",
                              style: TextStyle(
                                  fontSize: 27,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "Enter your credentials here",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.grey),
                            ),
                            Container(
                              width: 300,
                              margin: const EdgeInsets.only(top: 35),
                              child: Form(
                                  key: _formfield,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Email",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.grey),
                                      ),
                                      TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Enter email";
                                          }
                                          bool emailValid = RegExp(
                                                  r'^(?=.*?[a-z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                              .hasMatch(value);
                                          if (!emailValid) {
                                            return "Enter Valid Email";
                                          }
                                          return null;
                                        },
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 20),
                                        controller: emailController,
                                        decoration: const InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                            color: Colors.black,
                                          )),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                            color: Colors.blueAccent,
                                          )),
                                        ),
                                      ),
                                      Container(
                                        height: 35,
                                      ),
                                      const Text(
                                        "Password",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.grey),
                                      ),
                                      TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Enter password";
                                          } else if (passController
                                                  .text.length <
                                              6) {
                                            return "Enter At least 6 digits password";
                                          }
                                        },
                                        controller: passController,
                                        obscureText: _obsecureText,
                                        decoration: InputDecoration(
                                          suffixIcon: GestureDetector(
                                            child: Icon(_obsecureText
                                                ? Icons.visibility
                                                : Icons.visibility_off),
                                            onTap: () {
                                              setState(() {
                                                _obsecureText = !_obsecureText;
                                              });
                                            },
                                          ),
                                          enabledBorder:
                                              const UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                            color: Colors.black,
                                          )),
                                          focusedBorder:
                                              const UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                            color: Colors.blueAccent,
                                          )),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            FractionalOffset.bottomCenter,
                                        child: Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top: 20),
                                              width: 200,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.blueAccent,
                                                          minimumSize:
                                                              Size(100, 50),
                                                          foregroundColor:
                                                              Colors.white,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        21),
                                                          )),
                                                  onPressed: () async{
                                                    var sharedPref =  await SharedPreferences.getInstance();
                                                    sharedPref.setBool(HelloState.KEYLOGIN, true);

                                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PaymentScreen()));


                                                    },

                                                  child: const Center(
                                                      child: Text(
                                                    "Login",
                                                    style: TextStyle(
                                                        fontSize: 21,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ))),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  "Don't have an account?",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: Colors.grey),
                                                ),
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  SignUpScreen()));
                                                    },
                                                    child: const Text(
                                                      "Sign Up",
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 17),
                                                    ))
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ),
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
