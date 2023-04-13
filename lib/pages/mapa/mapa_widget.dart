import 'dart:async';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:paperbound/pages/mapa/mapa_model.dart';

class MapaWidget extends StatefulWidget {
  @override
  _MapaWidgetState createState() => _MapaWidgetState();
}

class _MapaWidgetState extends State<MapaWidget> {
  double? _lat;
  double? _long;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

Future<void> getCurrentLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    setState(() {
      _lat = location.latitude;
      _long = location.longitude;
    });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("openstreetmap Flutter"),
      ),
          body: Container(
        child: FlutterMap(
          options: MapOptions(center: LatLng(_lat!, _long!), zoom: 12.0),
          layers: [
            TileLayerOptions(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png'),
            MarkerLayerOptions(markers: [
              Marker(
                  width: 30.0,
                  height: 30.0,
                  point: LatLng(_lat!, _long!),
                  builder: (ctx) => Container(
                          child: Container(
                        child: Icon(
                          Icons.accessibility_new,
                          color: Color.fromARGB(255, 247, 15, 15),
                          size: 40,
                        ),
                      ))),
              Marker(
                  width: 30.0,
                  height: 30.0,
                  point: LatLng(41.38879, 2.15899),
                  builder: (ctx) => Container(
                          child: Container(
                        child: Icon(
                          Icons.book,
                          color: Colors.blueAccent,
                          size: 40,
                        ),
                      ))),
              Marker(
                  width: 30.0,
                  height: 30.0,
                  point: LatLng(40, 3),
                  builder: (ctx) => Container(
                          child: Container(
                        child: Icon(
                          Icons.book,
                          color: Colors.blueAccent,
                          size: 40,
                        ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
