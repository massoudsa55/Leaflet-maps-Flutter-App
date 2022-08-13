import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
// ignore: depend_on_referenced_packages
import 'package:latlong2/latlong.dart';

class PageTherry extends StatelessWidget {
  const PageTherry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var points = [
      LatLng(27.591585, 76.61139),
      LatLng(27.591548, 76.611397),
      LatLng(27.591473, 76.611407),
      LatLng(27.591437, 76.611413),
      LatLng(27.591362, 76.611425),
      LatLng(27.591325, 76.61143),
      LatLng(27.59125, 76.611442),
      LatLng(27.591177, 76.611452),
      LatLng(27.59114, 76.611458),
      LatLng(27.591065, 76.61147),
      LatLng(27.591028, 76.611475),
      LatLng(27.591007, 76.611587),
      LatLng(27.591013, 76.611693),
      LatLng(27.590777, 76.611805),
      LatLng(27.590657, 76.611822),
      LatLng(27.590535, 76.61184),
      LatLng(27.590413, 76.611857),
      LatLng(27.590293, 76.611875),
      LatLng(27.590172, 76.611892)
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Leaflet Maps')),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(27.563896, 76.600460),
          minZoom: 10.0,
        ),
        layers: [
          TileLayerOptions(
              urlTemplate:
                  "https://api.mapbox.com/styles/v1/jainaman8/ckd5v8bs00zm01ir3w3bjrrb3/tiles/256/{z}/{x}/{y}@2x?access_token=ACCESS_TOKEN",
              additionalOptions: {
                'accessToken': '',
                'id': 'mapbox.mapbox-streets-v8'
              }),
          PolylineLayerOptions(
            polylines: [
              Polyline(points: points, strokeWidth: 2.0, color: Colors.red),
            ],
          )
        ],
      ),
    );
  }
}
