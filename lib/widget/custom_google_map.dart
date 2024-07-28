import 'package:flutter/material.dart';
import 'package:google_map/models/place_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
        zoom: 12, target: LatLng(31.20521120591691, 29.930664876455566));
    //  initMapStyle();
    initmarker();
    super.initState();
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  void initmarker() {
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
          ),
        )
        .toSet();
    marker.addAll(mymarker);
    // var mymarker = const Marker(
    //     markerId: MarkerId('11'),
    //     position: LatLng(31.189849301005083, 29.976243682347217));
    // marker.add(mymarker);
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
                  target: LatLng(30.04510690911965, 31.23664484086507),
                  zoom: 11);
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