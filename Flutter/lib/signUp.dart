
import 'package:flutter/material.dart';
import 'package:http/http.dart';


class SignUpScreen extends StatefulWidget{
  @override
  State<SignUpScreen> createState() =>_SignUpScreen();
    
  }
  class _SignUpScreen extends State<SignUpScreen>{
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    final _formfield = GlobalKey<FormState>();
    bool _obsecureText = true;

   void login(String email,password) async{
     try{
       Response response = await post(
         Uri.parse("https://reqres.in/api/register"),
         body:{
           'email': email,
           'password':password
         }
       );
       if(response.statusCode == 200){
         print("Login success");

       }
       else {
         print("Login Unsuccess");
       }


     }
     catch(e){
       print(e.toString());
     }
   }


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
                    style: TextStyle(fontSize: 30, color: Colors.white,fontWeight: FontWeight.bold),
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
                              "Sign Up Here ",
                              style:
                              TextStyle(fontSize: 27, color: Colors.blue ,fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "Enter your credentials here",
                              style:
                              TextStyle(fontSize: 17, color: Colors.grey),
                            ),
                            Container(
                              width: 300,
                              margin: const EdgeInsets.only(top: 40),
                              child: Form(
                                  key: _formfield,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Email",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.grey),
                                      ),
                                      TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Enter Your Email";
                                          }
                                          bool emailValid = RegExp(
                                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                              .hasMatch(value);
                                        /*  if (!emailValid) {
                                            return "Enter Valid Email";
                                          }*/
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
                                            fontSize: 18, color: Colors.grey),
                                      ),
                                      TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Enter password";
                                          } else if (passController
                                              .text.length <
                                              6) {
                                            return "Enter Atleast 6 digits password";
                                          }
                                        },
                                        controller: passController,
                                        obscureText: _obsecureText,
                                        decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                            icon: Icon(_obsecureText==false ? Icons.visibility
                                                : Icons.visibility_off),
                                            onPressed: () {
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
                                        child: Container(
                                          margin: EdgeInsets.only(top: 20),
                                          width: 200,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                  Colors.blueAccent,
                                                  minimumSize: Size(100, 50),
                                                  foregroundColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        21),
                                                  )),
                                              onPressed: () {
                                                if (_formfield.currentState!
                                                    .validate()) {
                                                  print("Success");
                                                  emailController.clear();
                                                  passController.clear();
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SignUpScreen()),
                                                  );
                                                }
                                              },
                                              child: const Center(
                                                  child: Text(
                                                    "Sign Up",
                                                    style: TextStyle(
                                                        fontSize: 21,
                                                        fontWeight:
                                                        FontWeight.w600),
                                                  ))),
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
  


