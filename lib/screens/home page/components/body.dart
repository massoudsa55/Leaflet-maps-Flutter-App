import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:leaflet_maps_flutter_app/screens/details%20page/details_page.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        // This location of dkelfa
        //center: LatLng(34.52, 2.57),
        center: LatLng(40.71, -74.00),
        minZoom: 10.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
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
      ],
    );
  }
}
