import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

import '../../../shared/styles/custom_icon.dart';



class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late MapController initMarker;
  bool isFirstCall = true;

  @override
  void initState() {
    super.initState();

    initMarker = MapController(
      initPosition: GeoPoint(latitude: 30.00962548737948, longitude: 31.19972769557873),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        OSMFlutter(
          controller: initMarker,
          osmOption: OSMOption(
            userTrackingOption: const UserTrackingOption(
              enableTracking: true,
              unFollowUser: false,
            ),
            zoomOption: const ZoomOption(
              initZoom: 1,
              minZoomLevel: 3,
              maxZoomLevel: 19,
              stepZoom: 1.0,
            ),
            userLocationMarker: UserLocationMaker(
              personMarker:  const MarkerIcon(
                icon: Icon(
                  MyCustomIconApp.maps_and_flags,
                  color: Colors.blue,
                  size: 48,
                ),
              ),
              directionArrowMarker: const MarkerIcon(
                icon: Icon(
                  Icons.double_arrow,
                  size: 10,
                ),
              ),
            ),

          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text("Hello"),
        ),
      ],
    );
  }
}
