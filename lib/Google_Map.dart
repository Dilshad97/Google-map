import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map_locator extends StatefulWidget {
  const Map_locator({Key? key}) : super(key: key);

  @override
  _Map_locatorState createState() => _Map_locatorState();
}

class _Map_locatorState extends State<Map_locator> {

  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(target: LatLng(23.0225,72.5714) ,zoom: 13),
    onMapCreated: (GoogleMapController controller) {
      _controller.complete(controller);
    }),
    ));
  }
}
