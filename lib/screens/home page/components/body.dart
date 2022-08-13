import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:leaflet_maps_flutter_app/screens/details%20page/details_page.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var points = <LatLng>[
      LatLng(35.22, -101.83),
      LatLng(32.77, -96.79),
      LatLng(29.76, -95.36),
      LatLng(29.42, -98.49),
      LatLng(35.22, -101.83)
    ];
    return FlutterMap(
      options: MapOptions(
        // This location of dkelfa
        //center: LatLng(34.52, 2.57),
        center: LatLng(40.71, -74.00),
        minZoom: 5.0,
      ),
      layers: [
        TileLayerOptions(
          //urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          urlTemplate:
              "https://api.mapbox.com/styles/v1/messaoud-mobdev123/cl6rzcjjv000714qx4vb2b564.html?title=view&access_token=pk.eyJ1IjoibWVzc2FvdWQtbW9iZGV2MTIzIiwiYSI6ImNsNnJ5M3J2cTA0YmIzZHFqMndlYXFhYjAifQ.RsXETDC_kMW9bbCcdV0R7w&zoomwheel=true&fresh=true#2/20/0",
          additionalOptions: {
            'accessToken':
                'pk.eyJ1IjoibWVzc2FvdWQtbW9iZGV2MTIzIiwiYSI6ImNsNnJ5M3J2cTA0YmIzZHFqMndlYXFhYjAifQ.RsXETDC_kMW9bbCcdV0R7w',
            'id': 'mapbox.satellite',
          },
        ),
        MarkerLayerOptions(
          markers: [
            Marker(
              height: 60,
              width: 60,
              point: LatLng(40.71, -74.00),
              builder: (context) => SizedBox(
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const DetailsPage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.location_on),
                  iconSize: 50,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ],
        ),
        // This is for cadre of your maps
        PolylineLayerOptions(
          polylines: [
            Polyline(
              points: points,
              borderStrokeWidth: 5.0,
              color: Colors.redAccent,
            ),
          ],
        ),
      ],
    );
  }
}
