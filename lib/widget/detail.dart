import 'package:flutter/material.dart';
import 'package:sailor/sailor.dart';
import 'package:wisatah_malang/constant/constant.dart';

class Detail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final hero_tag = Sailor.param<String>(context, 'hero_tag');
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Column(
          children: <Widget>[
            Hero(
              tag:  hero_tag,
              child: Container(
                width: double.infinity,
                height: 200.0,
                decoration: BoxDecoration(
                  color: Colors.blue
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 24.0
              ),
              child: Column(

              ),
            )
          ],
        ),
      ),
    );
  }
}
