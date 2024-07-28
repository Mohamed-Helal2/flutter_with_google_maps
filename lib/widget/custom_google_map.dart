import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPosition;

  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
        zoom: 10, target: LatLng(31.20521120591691, 29.930664876455566));
    super.initState();
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  late GoogleMapController googleMapController;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          mapType: MapType.normal,
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
                  zoom: 10);
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