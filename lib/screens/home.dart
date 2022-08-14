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

Completer<GoogleMapController> _controller = Completer();

class _HomeScreenState extends State<HomeScreen> {
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
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: Set<Marker>.of(_marker),
        compassEnabled: true,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        initialCameraPosition: _kInitalCameraPosition,
        mapType: MapType.normal,
        onMapCreated: ((controller) {}),
      ),
      floatingActionButton: FloatingActionButton(
        child: IconButton(
          icon: const Icon(Icons.ac_unit),
          onPressed: () async {
            GoogleMapController controller = await _controller.future;

            controller.animateCamera(CameraUpdate.newCameraPosition(
                const CameraPosition(target: LatLng(23.716958, 23), zoom: 14)));
            setState(() {});
            print("hello");
          },
        ),
        onPressed: () async {
          // print("hello");
        },
      ),
    );
  }
}
