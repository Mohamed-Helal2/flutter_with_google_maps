import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolygonesModel {
  final PolygonId polygoneid;
  final List<LatLng> points;
  final Color? color;
  final Color? strokeColor;
  final int? strokewidth;
  PolygonesModel(
      {required this.polygoneid,
      required this.points,
      this.color = Colors.black,
      this.strokeColor = Colors.white,
      this.strokewidth=1
      });
}

List<PolygonesModel> polygoneslist = [
  PolygonesModel(
    polygoneid: const PolygonId("1"),
    points: [
      const LatLng(31.23832792488667, 29.947772711797597),
      const LatLng(31.209234040358023, 29.945271094139706),
      const LatLng(31.207522356522947, 30.014649290518637),
      const LatLng(31.24773873458422, 29.993802476702854),
    ],
    color: const Color.fromARGB(255, 210, 161, 246).withOpacity(0.399),
  )
];
