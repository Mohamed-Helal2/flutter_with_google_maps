import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolyLineModel {
  final   PolylineId id;
  final List<LatLng> points;
  final Color color;
  final int width;
  final int zindex;
  final Cap startCap;
 final bool? geodesic ;

  PolyLineModel(
      {required this.id,
      required this.points,
      required this.color,
      required this.width,
      required this.zindex,
      required this.startCap,
      this.geodesic=false,
      });
}

List<PolyLineModel> polylines1 = [
  PolyLineModel(
    id:const PolylineId("1"),
    points: [
      const LatLng(31.21191522052926, 29.92427982633363),
      const LatLng(31.20339727664202, 29.927052810405023),
      const LatLng(31.2105992555538, 29.938753450656503),
      const LatLng(31.214662780674352, 29.936707529486206),
      const LatLng(31.216614945944173, 29.94194914577136)
    ],
    color: const Color.fromARGB(255, 105, 54, 244),
    width: 4,
    zindex: 1,
    startCap: Cap.roundCap,
  ),
  PolyLineModel(
      id:const PolylineId("2"),
      points: [
        const LatLng(31.206564479439706, 29.924854713223773),
        const LatLng(31.211004169712073, 29.92649483187731),
        const LatLng(31.20951465517094, 29.935151952976117),
        const LatLng(31.20370098560707, 29.94029211866363),
      ],
      color: const Color.fromARGB(255, 142, 243, 33),
      width: 4,
      zindex: 2,
      startCap: Cap.roundCap,
       
      ),
  PolyLineModel(
      id:const PolylineId("3"),
      points: [
      const  LatLng(-34.533984914451416, 20.054671114995198),
     const   LatLng(81.24922029008806, 95.84177177114226)
      ],
      color: const Color.fromARGB(255, 83, 121, 72),
      startCap: Cap.squareCap,
      geodesic: true,
      width: 2,
      zindex: 3)
];
