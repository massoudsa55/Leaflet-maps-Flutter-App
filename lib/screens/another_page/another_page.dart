import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class PolylinePage extends StatefulWidget {
  static const String route = 'polyline';

  const PolylinePage({Key? key}) : super(key: key);

  @override
  State<PolylinePage> createState() => _PolylinePageState();
}

class _PolylinePageState extends State<PolylinePage> {
  late Future<List<Polyline>> polylines;

  Future<List<Polyline>> getPolylines() async {
    final polyLines = [
      Polyline(
        points: [
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
        ],
        strokeWidth: 4,
        color: Colors.amber,
      ),
    ];
    await Future<void>.delayed(const Duration(seconds: 3));
    return polyLines;
  }

  @override
  void initState() {
    polylines = getPolylines();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final points = <LatLng>[
      LatLng(51.5, -0.09),
      LatLng(53.3498, -6.2603),
      LatLng(55.8566, 2.3522),
    ];

    final pointsGradient = <LatLng>[
      LatLng(55.5, -0.09),
      LatLng(54.3498, -6.2603),
      LatLng(52.8566, 2.3522),
    ];

    return Scaffold(
        appBar: AppBar(title: const Text('Polylines')),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: FutureBuilder<List<Polyline>>(
            future: polylines,
            builder:
                (BuildContext context, AsyncSnapshot<List<Polyline>> snapshot) {
              debugPrint('snapshot: ${snapshot.hasData}');
              if (snapshot.hasData) {
                return Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      child: Text('Polylines'),
                    ),
                    Flexible(
                      child: FlutterMap(
                        options: MapOptions(
                          center: LatLng(27.591585, 76.61139),
                          zoom: 5,
                          onTap: (tapPosition, point) {
                            setState(() {
                              debugPrint('onTap');
                              polylines = getPolylines();
                            });
                          },
                        ),
                        layers: [
                          TileLayerOptions(
                            urlTemplate:
                                'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                            subdomains: ['a', 'b', 'c'],
                            userAgentPackageName:
                                'dev.fleaflet.flutter_map.example',
                          ),
                          PolylineLayerOptions(
                            polylines: [
                              Polyline(
                                  points: points,
                                  strokeWidth: 4,
                                  color: Colors.purple),
                            ],
                          ),
                          PolylineLayerOptions(
                            polylines: [
                              Polyline(
                                points: pointsGradient,
                                strokeWidth: 4,
                                gradientColors: [
                                  const Color(0xffE40203),
                                  const Color(0xffFEED00),
                                  const Color(0xff007E2D),
                                ],
                              ),
                            ],
                          ),
                          PolylineLayerOptions(
                            polylines: snapshot.data!,
                            polylineCulling: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return const Text(
                  'With Messaoud Getting map data...\n\nTap on map when complete to refresh map data.');
            },
          ),
        ));
  }
}
