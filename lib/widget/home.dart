import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wisatah_malang/bloc/networkBloc.dart';
import 'package:wisatah_malang/constant/constant.dart';
import 'package:wisatah_malang/routes/routes.dart';
import 'package:wisatah_malang/widget/detail.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  StreamSubscription _connectionChange;
  bool isOffline = false;
  NetworkBloc networkBloc, connectionStatus;

  @override
  void initState() {
    super.initState();
    networkBloc = NetworkBloc.getInstance();
    networkBloc.initialize();
  }

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
        body: StreamBuilder(
            stream: networkBloc.connectionChangeController.stream,
            builder: (context, snapshot) {
              if (snapshot.data == false) {
                return Container(
                  child: Center(
                    child: Text("Internet E Bang"),
                  ),
                );
              }
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 24.0),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Routes.sailor.navigate("/detail",
                          params: {"hero_tag": "image$index"}),
                      child: Hero(
                        tag: "image$index",
                        child: Center(
                          child: Container(
                            margin: EdgeInsets.only(right: 8.0),
                            height: double.infinity,
                            width: 260.0,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
      ),
    );
  }
}
