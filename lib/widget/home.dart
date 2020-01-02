import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wisatah_malang/bloc/networkBloc.dart';
import 'package:wisatah_malang/bloc/placesBloc.dart';
import 'package:wisatah_malang/constant/constant.dart';
import 'package:wisatah_malang/model/placesModel.dart';
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
    placesBloc.getData();
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
                child: StreamBuilder<List<PlacesModel>>(
                    stream: placesBloc.placesData,
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => Routes.sailor.navigate("/detail",
                                params: {
                                  "hero_tag": "image$index",
                                  "places_detail": snapshot.data[index]
                                }),
                            child: Hero(
                              tag: "image$index",
                              child: Center(
                                child: Container(
                                  margin: EdgeInsets.only(right: 8.0),
                                  height: double.infinity,
                                  width: 260.0,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10.0),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            snapshot.data[index].gambar,
                                          ),
                                          fit: BoxFit.cover)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12.0, horizontal: 14.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        Text(
                                          snapshot.data[index].nama,
                                          style: TextStyle(
                                              fontSize: 24.0, color: white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
              );
            }),
      ),
    );
  }
}
