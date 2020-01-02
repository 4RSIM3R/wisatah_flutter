import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:sailor/sailor.dart';
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
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Hero(
                tag: hero_tag,
                child: Container(
                  width: double.infinity,
                  height: 250.0,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                          image: NetworkImage(places_detail.gambar),
                          fit: BoxFit.cover)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      places_detail.nama,
                      style: TextStyle(fontSize: 24.0),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      places_detail.deskripsi,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 200.0,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: FlutterMap(
                        options: new MapOptions(
                          center: LatLng(places_detail.lat, places_detail.lng),
                          zoom: 13.0,
                        ),
                        layers: [
                          TileLayerOptions(
                            urlTemplate: "https://api.tiles.mapbox.com/v4/"
                                "{id}/{z}/{x}/{y}@2x.png?access_token={pk.eyJ1IjoiaWx6YW0iLCJhIjoiY2pucXlrZXZxMDJxNjNxcGszdWx2M3ZxNCJ9.IedTfg3xkodmaRhTAkXdIg}",
                            additionalOptions: {
                              'accessToken':
                                  'pk.eyJ1IjoiaWx6YW0iLCJhIjoiY2pucXlrZXZxMDJxNjNxcGszdWx2M3ZxNCJ9.IedTfg3xkodmaRhTAkXdIg',
                              'id': 'mapbox.streets',
                            },
                          ),
                          MarkerLayerOptions(markers: [
                            Marker(
                              height: 75.0,
                              width: 75.0,
                              point: LatLng(places_detail.lat, places_detail.lng),
                              builder: (contex) => Container(
                                child: FlutterLogo(),
                              ),
                            )
                          ])
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
