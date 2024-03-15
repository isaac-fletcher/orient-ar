import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class Mapper extends StatefulWidget {
  const Mapper({super.key});

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<Mapper> {
  final CameraPosition _initialLocation =
      const CameraPosition(target: LatLng(34.67833, -82.83917), zoom: 15.5);
  late GoogleMapController mapController;

  late String _mapStyleString = "";

  bool _mapCreated = false;

  @override
  void initState() {
    rootBundle.loadString('assets/data/map_style.json').then((string) {
      _mapStyleString = string;
    });
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      _mapCreated = true;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: _initialLocation,
            myLocationEnabled: true,
            mapType: MapType.normal,
            zoomGesturesEnabled: true,
            style: _mapStyleString,
          ),
          if (!_mapCreated) const Center(child: CircularProgressIndicator())
        ]
      )
    );
  }
}
