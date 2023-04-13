import 'dart:async';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart' as latlong;
import '../cart_view/cart_view_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
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
        backgroundColor: Color(0xFFB4FFA8),
        automaticallyImplyLeading: true,
        title: Text(
          "Encuentra tu tienda",
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Poppins',
                fontSize: 24.0,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
        ),
        centerTitle: true,
        toolbarHeight: 100.0,
        elevation: 4.0,
      ),
      body: _lat == null || _long == null
          ? Center(
              child: SizedBox(
                width: 48.0,
                height: 48.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
            )
          : Container(
              child: FlutterMap(
                options: MapOptions(
                    center: latlong.LatLng(_lat!, _long!), zoom: 12.0),
                layers: [
                  TileLayerOptions(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png'),
                  MarkerLayerOptions(
                    markers: [
                      Marker(
                          width: 30.0,
                          height: 30.0,
                          point: latlong.LatLng(_lat!, _long!),
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
                          point: latlong.LatLng(41.38879, 2.15899),
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
                        point: latlong.LatLng(40, 3),
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
