import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel {
  final int id;
  final String name;
  final LatLng latLng;

  PlaceModel(
      {required this.id,
      required this.name,
      
      required this.latLng});
}

List<PlaceModel> places = [PlaceModel(id: 1, name: "مسجد البرنس", latLng:const LatLng(31.207112, 29.939931)),
PlaceModel(id: 2, name: "نادى إسكندرية الرياضى - سبورتنج", latLng:const LatLng(31.213520383783354, 29.933308933095795)),
PlaceModel(id: 3, name: "معبد الرأس السوداء", latLng:const LatLng(31.203570824860456, 29.921202490321054))
];

