import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_map/models/place_model.dart';
import 'package:google_map/models/polyLine_model.dart';
import 'package:google_map/models/polygones_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPosition;
  String? mapStyle;
  late GoogleMapController googleMapController;
  Set<Marker> marker = {};
  Set<Polyline> polylines = {};
  Set<Polygon> polygones = {};
  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
        zoom: 5.2, target: LatLng(31.20521120591691, 29.930664876455566));
    //  initMapStyle();
    initmarker();
    initpolylines();
    initpolygones();
    super.initState();
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  Future<Uint8List> getimagefromRowdata(String image, int width) async {
    var imagedata = await rootBundle.load(image);
    var imagecode = await ui.instantiateImageCodec(
        imagedata.buffer.asUint8List(),
        targetWidth: width);
    var imageframe = await imagecode.getNextFrame();
    var imagebytedata =
        await imageframe.image.toByteData(format: ui.ImageByteFormat.png);
    return imagebytedata!.buffer.asUint8List();
  }

  void initmarker() async {
    var customMarkerIcon =
        // await BitmapDescriptor.bytes(
        //     await getimagefromRowdata('assets/images/qq.jpg', 40));
        await BitmapDescriptor.asset(
            const ImageConfiguration(), 'assets/images/test1.png');
    var mymarker = places
        .map(
          (e) => Marker(
              infoWindow: InfoWindow(
                title: e.name,
                onTap: () {
                  print("-------- ${e.name} + ${e.id}");
                },
              ),
              markerId: MarkerId(e.id.toString()),
              position: e.latLng,
              icon: customMarkerIcon),
        )
        .toSet();
    marker.addAll(mymarker);
    setState(() {});
    // var mymarker = const Marker(
    //     markerId: MarkerId('11'),
    //     position: LatLng(31.189849301005083, 29.976243682347217));
    // marker.add(mymarker);
  }

  void initpolylines() {
    var myplylines = polylines1
        .map(
          (e) => Polyline(
              polylineId: e.id,
              points: e.points,
              color: e.color,
              geodesic: e.geodesic!,
              width: e.width,
              zIndex: e.zindex,
              startCap: e.startCap),
        )
        .toSet();
    polylines.addAll(myplylines);
    setState(() {});
  }

  void initpolygones() {
    var mypolygones = polygoneslist
        .map(
          (e) => Polygon(polygonId: e.polygoneid, points: e.points,
          fillColor: e.color!,
          strokeColor: e.strokeColor!,
          strokeWidth: e.strokewidth!,
          geodesic: true,
          holes:e.holes??[], 
          ),
        )
        .toSet();
    polygones.addAll(mypolygones);
    setState(() {});
  }

  Future<void> initMapStyle() async {
    String nightStyle = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style/night.json');
    setState(() {
      mapStyle = nightStyle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          polygons: polygones,
          polylines: polylines,
          zoomControlsEnabled: false,
          // style: mapStyle,
          markers: marker,
          //  mapType: MapType.normal,
          onMapCreated: (controller) {
            googleMapController = controller;
          },
          // cameraTargetBounds: CameraTargetBounds(LatLngBounds(
          //     northeast: const LatLng(31.30095371821873, 30.075691671804655),
          //     southwest: const LatLng(
          //         31.103027162535845, 29.853218527721232))), // border for map
          initialCameraPosition: initialCameraPosition,
        ),
        Positioned(
          bottom: 10,
          left: 7,
          right: 7,
          child: ElevatedButton(
            onPressed: () {
              CameraPosition newlocation = const CameraPosition(
                  target: LatLng(31.213520383783354, 29.933308933095795),
                  zoom: 16);
              googleMapController
                  .animateCamera(CameraUpdate.newCameraPosition(newlocation));
            },
            child: const Text(
              'change location',
            ),
          ),
        )
      ],
    );
  }
}

// world view  0 -> 3
// country view 4 -> 6
// city view 10 - > 12
// street view 13 -> 17
// building view 18 -> 20 