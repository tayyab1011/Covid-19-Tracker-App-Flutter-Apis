import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Models/ProductModel.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  Future<ProductModel> getApi() async {
    final response = await http.get(
        Uri.parse("https://webhook.site/a4321215-ec34-4ad3-9815-bb5c17dd72f3"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProductModel.fromJson(data);
    } else {
      return ProductModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
      children: [
          Expanded(
              child: FutureBuilder<ProductModel>(
                  future: getApi(),
                  builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text("Load");

            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(snapshot.data!.data![index].shop!.name.toString()),
                          subtitle: Text(snapshot.data!.data![index].shop!.shopemail.toString()),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(snapshot.data!.data![index].shop!.image.toString()),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          height: MediaQuery.of(context).size.height*.3,
                            width: MediaQuery.of(context).size.width*1,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                 itemCount: snapshot.data!.data![index].images!.length,
                                  itemBuilder: (context,position){
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Container(
                                        height: MediaQuery.of(context).size.height*.25,
                                        width: MediaQuery.of(context).size.width*.5,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(21),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(snapshot.data!.data![index].images![position].url.toString())
                                          )
                                        ),

                                      ),
                                    );

                              })



                        ),
                        Icon(snapshot.data!.data![index].inWishlist! == true ? Icons.favorite : Icons.favorite_border_outlined)
                      ],
                    );
                  });
            }
          }))
      ],
    ),
        ));
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;

  ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
