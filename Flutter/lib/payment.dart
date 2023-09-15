import 'package:flutter/material.dart';
import 'package:flutter_project/login.dart';

class PaymentScreen extends StatefulWidget {
  @override
  State<PaymentScreen> createState() => _PaymentScreen();
}

class _PaymentScreen extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    //  var arrNames = ['John Doe','Amelia Nelson','Martin Anderson','Tayyab','Ali','Sikander'];
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FormScreen(),
                    ));
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.grey,
              )),
          title: Text(
            "Wallet",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(21),
                      bottomRight: Radius.circular(21))),
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Image.asset('assets/images/card.png'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 5),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(21)),
                elevation: 5,
                child: Container(
                  height: 105,
                  width: 500,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 25, right: 10),
                        child: Column(
                          children: [
                            CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    AssetImage('assets/images/upload.png')),
                            Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  "Send",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 35, right: 10),
                        child: Column(
                          children: [
                            CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    AssetImage('assets/images/transfer.png')),
                            Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  "Transfer",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 35, right: 10),
                        child: Column(
                          children: [
                            CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    AssetImage('assets/images/cash-book.png')),
                            Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  "Book",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 35),
                        child: Column(
                          children: [
                            CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                backgroundImage:
                                    AssetImage('assets/images/add.png')),
                            Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  "More",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(21),
                      topRight: Radius.circular(21)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Transactions",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 21),
                          ),
                          OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(21))),
                              onPressed: () {},
                              child: Text(
                                "More",
                                style: TextStyle(color: Colors.grey),
                              ))
                        ],
                      ),
                      Expanded(
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: const [
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/tayyab.jpg'),
                              ),
                              title: Text("Tayyab"),
                              subtitle: Text("Number"),
                              trailing: Text("250,000"),
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                AssetImage('assets/images/tayyab.jpg'),
                              ),
                              title: Text("Tayyab"),
                              subtitle: Text("Number"),
                              trailing: Text("250,000"),
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                AssetImage('assets/images/tayyab.jpg'),
                              ),
                              title: Text("Tayyab"),
                              subtitle: Text("Number"),
                              trailing: Text("250,000"),
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                AssetImage('assets/images/tayyab.jpg'),
                              ),
                              title: Text("Tayyab"),
                              subtitle: Text("Number"),
                              trailing: Text("250000"),
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                AssetImage('assets/images/tayyab.jpg'),
                              ),
                              title: Text("Tayyab"),
                              subtitle: Text("Number"),
                              trailing: Text("250,000"),
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/man.png'),
                              ),
                              title: Text("Tayyab"),
                              subtitle: Text("Number"),
                              trailing: Text("250,000"),
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/man.png'),
                              ),
                              title: Text("Tayyab"),
                              subtitle: Text("Number"),
                              trailing: Text("250,000"),
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/man.png'),
                              ),
                              title: Text("Tayyab"),
                              subtitle: Text("Number"),
                              trailing: Text("250,000"),
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/man.png'),
                              ),
                              title: Text("Tayyab"),
                              subtitle: Text("Number"),
                              trailing: Text("250,000"),
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                AssetImage('assets/images/man.png'),
                              ),
                              title: Text("Tayyab"),
                              subtitle: Text("Number"),
                              trailing: Text("250,000"),
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                AssetImage('assets/images/man.png'),
                              ),
                              title: Text("Tayyab"),
                              subtitle: Text("Number"),
                              trailing: Text("250,000"),
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                AssetImage('assets/images/man.png'),
                              ),
                              title: Text("Tayyab"),
                              subtitle: Text("Number"),
                              trailing: Text("250,000"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
