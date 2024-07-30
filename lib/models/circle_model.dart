import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CircleModel {
  final CircleId circleId;
  final double radius;
  final int? strokewidth;
  final Color? strokecolor;
  final Color? fillcolr;
  final LatLng centre;
  CircleModel(
      {required this.circleId,
      required this.radius,
      this.strokewidth = 2,
      this.strokecolor = Colors.white,
      this.fillcolr = Colors.yellow,
      required this.centre});
}

List<CircleModel> circleslist = [
  CircleModel(
      circleId: CircleId('1'),
      radius: 100000,
      centre: const LatLng(29.672551101418904, 26.82048553161126),
      fillcolr: Colors.yellow.withOpacity(0.3),
      //strokewidth: 10,
      strokecolor: Colors.black
      )
];
