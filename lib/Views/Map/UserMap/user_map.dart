import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:grade_project/shared/styles/log_app.dart';
import 'package:latlong2/latlong.dart';  // للتعامل مع النقاط والمسافات
import 'package:geolocator/geolocator.dart';  // للحصول على الموقع المباشر
import 'package:http/http.dart' as http;  // لإرسال طلبات HTTP
import 'dart:convert';

class RouteWithLiveLocationMap extends StatefulWidget {
  @override
  _RouteWithLiveLocationMapState createState() => _RouteWithLiveLocationMapState();
}

class _RouteWithLiveLocationMapState extends State<RouteWithLiveLocationMap> {
  LatLng? liveLocation;  // الموقع المباشر
  LatLng? userSelectedLocation;  // الموقع الذي يختاره المستخدم
  List<LatLng> routeCoordinates = [];  // نقاط المسار بين النقطتين
  String distanceText = '';
  late MapController _mapController;
  IconApp iconApp=IconApp();
  // قائمة تحتوي على العلامات الثابتة
  final List<LatLng> fixedMarkers = [
    const LatLng(29.993228591871922, 31.312598656897627),  // مثال: مبنى إمباير ستيت
    const LatLng(29.982048263044135, 31.34711808698053),  // مثال: تمثال الحرية
    const LatLng(29.976922650709948, 31.349119534633264),  // مثال: ميدان التايمز
    const LatLng(29.980926771921478, 31.314127038985955),  // مثال: مانهاتن
    const LatLng(29.95966078496634, 31.258560398395222),  // مثال: بروكلين
    const LatLng(29.998878868035085, 31.207448224703036),  // مثال: جسر بروكلين
    const LatLng(30.024121114614594, 31.276262228674128),  // مثال: سنترال بارك
  ];// للتحكم بالكاميرا// لعرض المسافة المحسوبة بين النقطتين

  @override
  void initState() {
    super.initState();
    _mapController = MapController();  // تهيئة MapController
    _checkPermissionsAndGetLocation();  // تحقق من أذونات الموقع واحصل على الموقع المباشر
  }

  Future<void> _checkPermissionsAndGetLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _showSnackBar("GPS غير مفعل. يرجى تفعيله.");  // إظهار رسالة تنبيه  // إظهار رسالة تنبيه
        return;
      }
      Position position = await Geolocator.getCurrentPosition();
      setState(() {
        liveLocation = LatLng(position.latitude, position.longitude);
        _mapController.move(liveLocation!, 18);
      });// تحديث الموقع المباشر
    }

    if (!(await Geolocator.isLocationServiceEnabled())) {
      _showSnackBar("GPS مغلق. يرجى تفعيله.");
      return;
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      liveLocation = LatLng(position.latitude, position.longitude);// احصل على الموقع المباشر
      _mapController.move(liveLocation!, 16);
    });
  }
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 4),  // مدة عرض الرسالة
      ),
    );
  }

  Future<void> _getRoute() async {
    if (liveLocation == null || userSelectedLocation == null) {
      _showSnackBar("الرجاء التأكد من تشغيل GPS قبل تحديد المسار.");
      return;
    }

    final response = await http.get(
        Uri.parse(
            'http://router.project-osrm.org/route/v1/driving/${liveLocation!.longitude},${liveLocation!.latitude};${userSelectedLocation!.longitude},${userSelectedLocation!.latitude}?overview=full&geometries=geojson'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      // الحصول على النقاط لرسم المسار الفعلي بين النقطتين
      final List coordinates = data['routes'][0]['geometry']['coordinates'];

      routeCoordinates = coordinates.map((c) {
        return LatLng(c[1], c[0]);
      }).toList();

      // حساب المسافة
      const distanceCalculator =   Distance();
      double distanceInMeters = distanceCalculator.as(
          LengthUnit.Meter, liveLocation!, userSelectedLocation!);
      distanceText = 'المسافة: ${distanceInMeters.toStringAsFixed(2)} متر';

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Text(distanceText,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),  // لعرض المسافة بين النقطتين
          Expanded(
            child: FlutterMap(
              mapController: _mapController,  // استخدام MapController للتحكم بالكاميرا

              options: MapOptions(
                initialCenter: liveLocation ?? const LatLng(0, 0),  // مركز الخريطة
                initialZoom: 18,  // مستوى التقريب
                onTap: (tapPosition, point) {
                  setState(() async{
                         if (!(await Geolocator.isLocationServiceEnabled())) {
                           _showSnackBar("GPS مغلق. يرجى تفعيله.");
                            return;
                         }

                          setState(() {
                           userSelectedLocation = point;  // عند النقر على الخريطة
                           _getRoute();  // احصل على المسار
                         }
                                  );


    },
                  );
                },
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                ),
                if (liveLocation != null)
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: liveLocation!,  // العلامة الحمراء (الموقع المباشر)
                        width: 80,
                        height: 80,
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                if (userSelectedLocation != null)
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: userSelectedLocation!,  // العلامة الزرقاء (الموقع الذي يختاره المستخدم)
                        width: 80,
                        height: 80,
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.blue,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                if (routeCoordinates.isNotEmpty)
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: routeCoordinates,  // الخط بين النقطتين بناءً على الطرق الفعلية
                        color: Colors.blue,
                        strokeWidth: 4.0,
                      ),
                    ],
                  ),
                MarkerLayer(
                  markers: fixedMarkers.map((latLng) => Marker(
                    point: latLng,
                    width: 50,
                    height: 50,
                    child:  const Icon(
                      Icons.location_on,
                      color: Colors.orange,

                      size: 50,
                    ),
                  )).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
