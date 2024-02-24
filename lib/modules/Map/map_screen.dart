
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}
List<Polyline>myPolyLine=[];
createPolyline(){
  myPolyLine.add(
    const Polyline(polylineId:
   PolylineId("1"),
    width: 3,
    color: Colors.green,

    points: [

      LatLng(29.96670000, 31.25000000),
      LatLng(30.02750000, 31.76500000),],
    //gap :distance between 2 point
    //dash:length line
   /* patterns: [PatternItem.dot,PatternItem.gap(1)]*/)
  );
}
//draw circle
Set<Circle> circles = {const Circle(
  circleId: CircleId("1"),
  strokeWidth: 1,
  fillColor: Colors.black,
  center: LatLng(29.96670000,31.25000000),
  radius: 300,
),
  const Circle(
    circleId: CircleId("2"),
    strokeWidth:2 ,
    fillColor: Colors.black,
    center: LatLng(30.02750000,	31.76500000),
    radius: 300,
  ),

};

class _MapScreenState extends State<MapScreen> {
  var myMark=HashSet<Marker>();
  late GoogleMapController mapController;
  late BitmapDescriptor customMarker;
  getCustomMarker()  async {
    customMarker=await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, 'asset/image/bus_waiting2.png' );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCustomMarker();

  }
  @override
  Widget build(BuildContext context) {
    return  GoogleMap(
      mapType: MapType.terrain,
        initialCameraPosition: const CameraPosition(target: LatLng(29.992210,  31.312690),zoom: 9),
        onMapCreated: (mapController) {
    setState(() {
    myMark.add(
        Marker(
          icon: customMarker,

          markerId: const MarkerId("1"),
            position: const LatLng(30.00000000, 31.23333333),
          infoWindow: const InfoWindow(
              title: "هنا حرامي",
              snippet: "ahmed Ali ,35 year, no money and no time "),
            onTap: () {
                       print("okay man ,thank you ");
          }),
    );
    myMark.add(const Marker(markerId: MarkerId("2"),position: LatLng(29.84194444, 31.33416667)));

    });
    },
        markers:myMark,
      circles: circles,

    
    );
  }
}
