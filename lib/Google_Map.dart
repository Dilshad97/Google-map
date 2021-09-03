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
  Set<Marker> _markers = Set();

  Completer<GoogleMapController> _controller = Completer();


//   void OnTap() {
//     setState(() {
// _markers=true;
//
//     });
//   }


  // @override
  // void initState() {
  //   // setState(() {
  //   //   markers = _markers;
  //   // });
  //   super.initState();
  // }


  @override
  Widget build(BuildContext context) {


    _markers.addAll([
      // Marker(
      //     markerId: MarkerId('value'),
      //     position: LatLng(22.3039, 70.8022)),
      Marker(
          markerId: MarkerId('value2'),
          position: LatLng(23.0225,72.5714)),
    ]);


    return SafeArea(child: Scaffold(

      body: GoogleMap(
        // markers: Set<Marker>.of(markers.values),
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(target: LatLng(23.0225,72.5714) ,zoom: 13),
    onMapCreated: (GoogleMapController controller) {
      _controller.complete(controller);
    },
        onTap: (LatLng latLng) {
          _markers.add(Marker(markerId: MarkerId('mark'), position: latLng));
          setState(() {});
        } ,
        markers: Set<Marker>.of(_markers),
    )



    ));

  }
}
