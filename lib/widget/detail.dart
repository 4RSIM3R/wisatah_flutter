import 'package:flutter/material.dart';
import 'package:sailor/sailor.dart';
import 'package:wisatah_malang/bloc/placesBloc.dart';
import 'package:wisatah_malang/constant/constant.dart';
import 'package:wisatah_malang/model/placesModel.dart';

class Detail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final hero_tag = Sailor.param<String>(context, 'hero_tag');
    final places_detail = Sailor.param<PlacesModel>(context, 'places_detail');
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Column(
          children: <Widget>[
            Hero(
              tag:  hero_tag,
              child: Container(
                width: double.infinity,
                height: 250.0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    image: NetworkImage(places_detail.gambar),
                    fit: BoxFit.cover
                  )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 24.0
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(places_detail.nama, style: TextStyle(fontSize: 24.0),),
                  SizedBox(height: 8.0,),
                  Text(places_detail.deskripsi, style: TextStyle(fontSize: 18.0),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
