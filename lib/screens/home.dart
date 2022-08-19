import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? controller;
  bool hello = false;
  static const CameraPosition _kInitalCameraPosition = CameraPosition(
    target: LatLng(27.716958, 85.325436),
    zoom: 14,
  );

  final List<Marker> _marker = [];
  final List<Marker> _list = const [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(27.7, 85.325436),
        infoWindow: InfoWindow(title: 'My Position')),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(27.716958, 85.325436),
        infoWindow: InfoWindow(title: 'Her Position')),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(27.71058, 85.30436),
        infoWindow: InfoWindow(title: 'Her School')),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _marker.addAll(_list);
  }

  @override
  void dispose() {
    controller!.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(hello.toString())),
      body: GoogleMap(
        markers: Set<Marker>.of(_marker),
        compassEnabled: true,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        initialCameraPosition: _kInitalCameraPosition,
        mapType: MapType.normal,
        onMapCreated: _controller.complete,
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.ac_unit),
          onPressed: () async {
            Future.delayed(const Duration(milliseconds: 500));
            controller = await _controller.future;
            controller!.animateCamera(
                CameraUpdate.newCameraPosition(_kInitalCameraPosition));

            setState(() {
              hello = false;
            });
          }),
    );
  }
}
