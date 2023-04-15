import 'dart:async';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart' as latlong;
import 'package:paperbound/models/store.dart';
import '../../provider/StoreProvider.dart';
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
  List<Store>? markers;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    getStores();
  }

  Future<void> getCurrentLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    setState(() {
      _lat = location.latitude;
      _long = location.longitude;
    });
  }

  Future<void> getStores() async {
    StoreProvider storeProvider = StoreProvider();
    List<Store> st = await storeProvider.getAllStores();

    setState(() {
      markers = st;
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
      body: _lat == null || _long == null || markers == null
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
                  MarkerLayerOptions(markers: [
                    ...markers!
                        .map((markerData) => Marker(
                              width: 50.0,
                              height: 50.0,
                              point: latlong.LatLng(
                                  double.parse(markerData.latitude),
                                  double.parse(markerData.length)),
                              builder: (ctx) => Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.red,
                                    size: 50,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Container(
                                            height: 200,
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  title: Text(markerData.name),
                                                  subtitle:
                                                      Text(markerData.name),
                                                  leading: Icon(Icons.map),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                      'Contenido de la tarjeta'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Icon(
                                      Icons.location_on,
                                      color: Colors.red,
                                      size: 50,
                                    ),
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
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
                  ]),
                ],
              ),
            ),
    );
  }
}
