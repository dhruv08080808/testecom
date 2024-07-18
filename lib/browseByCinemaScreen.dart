import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BrowseByCinemaScreen extends StatefulWidget {
  const BrowseByCinemaScreen({super.key});

  @override
  State<BrowseByCinemaScreen> createState() => _BrowseByCinemaScreenState();
}

class _BrowseByCinemaScreenState extends State<BrowseByCinemaScreen> {
  static final LatLng _kMapCenter =
      LatLng(19.018255973653343, 72.84793849278007);

  static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kInitialPosition,
        onMapCreated: (GoogleMapController controller) {
          // _controller.complete(controller);
        },
      ),
    );
  }
}
