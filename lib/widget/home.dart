import 'package:flutter/material.dart';
import 'package:wisatah_malang/constant/constant.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: black,
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: black,
              ),
            )
          ],
          backgroundColor: white,
          elevation: 0.0,
          title: Text(
            "Wisatah",
            style: TextStyle(color: black),
          ),
          centerTitle: true,
        ),
        backgroundColor: white,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 24.0),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index){
              return Container(
                margin: EdgeInsets.only(right: 8.0),
                height: double.infinity,
                width: 260.0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.0)
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
