import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolygonesModel {
  final PolygonId polygoneid;
  final List<LatLng> points;
  final Color? color;
  final Color? strokeColor;
  final int? strokewidth;
  List<List<LatLng>>? holes;
  PolygonesModel(
      {required this.polygoneid,
      required this.points,
      this.color = Colors.black,
      this.strokeColor = Colors.white,
      this.strokewidth = 1,
      this.holes});
}

List<PolygonesModel> polygoneslist = [
  PolygonesModel(
      polygoneid: const PolygonId("1"),
      points: [
        const LatLng(31.66286164252508, 25.137757529428146),
        const LatLng(22.01959585365498, 25.012231232107936),
        const LatLng(22.035942970064813, 36.840041237092514),
        const LatLng(29.52275448578988, 34.900860940227716),
        const LatLng(31.25948934608817, 34.111560765544574),
        const LatLng(31.589381941702616, 31.502037739041118),
        const LatLng(30.845497289576752, 29.0213800471798),
        const LatLng(31.410834166353588, 27.21726536218976),
      ],
      color:const Color.fromARGB(255, 247, 15, 50).withOpacity(0.10),
      holes: [
        [
          const LatLng(31.308099230837332, 32.28310681438828),
          const LatLng(30.773724157328566, 31.982319444224874),
          const LatLng(30.541613968132168, 31.867312508574155),
          const LatLng(30.312766324190193, 31.42940148436567),
          const LatLng(30.067898014578237, 31.20916566435091),
          const LatLng(30.55883587093659, 30.85465549975429),
          const LatLng(30.708176443593093, 30.706942931172367),
          const LatLng(30.911162509874288, 29.835438776539018),
          const LatLng(31.1421688454227, 29.931451946117267),
          const LatLng(31.44510302412258, 30.58508006209228),
          const LatLng(31.419895723306375, 30.987596811478024),
          const LatLng(31.53642263589532, 31.157466265347235),
          const LatLng(31.404137718936145, 31.50828361572931),
          const LatLng(31.50819523672488, 31.82688946946013),
        ],
        [const LatLng(29.70002169401295, 30.015540370089788),
        const LatLng(28.99543326013946, 26.445387326474567),
        const LatLng(25.734977780184735, 28.94304346304666),
        ]
      ])
];
