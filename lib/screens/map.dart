import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:orientation/widgets/task-card.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class Mapper extends StatefulWidget {
  final LatLng destination;

  const Mapper({super.key, required this.destination});

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<Mapper> {
  late GoogleMapController mapController;
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  // After adding polylines to the map
  double totalDistance = 0.0;

  final CameraPosition _initialLocation = CameraPosition(
    target: LatLng(34.67833, -82.83917), // Default location
    zoom: 18,
  );

  late String _mapStyleString = "";

  bool _mapCreated = false;

  @override
  void initState() {
    rootBundle.loadString('assets/data/map_style.json').then((string) {
      _mapStyleString = string;
    });
    super.initState();
    // Call the location permission check function in initState
    _checkLocationPermission();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    setState(() {
      _mapCreated = true;
    });
  }

  // Function to check location permission and get current position
  Future<void> _checkLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Instead of Future.error, show a dialog or a message to the user
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Location Services Disabled"),
            content:
                Text("Please enable location services to use this feature."),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text("OK"),
                onPressed: () =>
                    Navigator.of(context).pop(), // Close the dialog
              ),
            ],
          );
        },
      );
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("'Location Permissions are denied'"),
              content:
                  Text("Please enable location services to use this feature."),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text("OK"),
                  onPressed: () =>
                      Navigator.of(context).pop(), // Close the dialog
                ),
              ],
            );
          },
        );
        return;
      }
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    _addPolyLine(
        position); // Modify _addPolyLine to take Position as a parameter
  }

  // This method is called when the blue button is pressed and the Mapper screen is pushed onto the navigation stack.

  // Modify _addPolyLine to take Position as a parameter
  void _addPolyLine(Position currentPosition) async {
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyD2ka41HxCu705dcvKFGp8_3RPeWdFKWW8',
      PointLatLng(currentPosition.latitude, currentPosition.longitude),
      PointLatLng(widget.destination.latitude, widget.destination.longitude),
      travelMode: TravelMode.driving,
    );
    if (result.status == 'OK') {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
      setState(() {
        Polyline polyline = Polyline(
          polylineId: PolylineId('poly'),
          color: Color.fromARGB(255, 231, 24, 24),
          points: polylineCoordinates,
          width: 10,
        );
        _polylines.add(polyline);
        calculateDistance();
      });
    }
  }

  void calculateDistance() {
    // Assuming 'polylineCoordinates' is a List<LatLng> of the route's coordinates
    totalDistance = 0.0;
    for (int i = 0; i < polylineCoordinates.length - 1; i++) {
      totalDistance += Geolocator.distanceBetween(
        polylineCoordinates[i].latitude,
        polylineCoordinates[i].longitude,
        polylineCoordinates[i + 1].latitude,
        polylineCoordinates[i + 1].longitude,
      );
    }
    // Convert meters to miles or kilometers as needed, then display
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Route Distance"),
        content: Text(
            "Total distance: ${totalDistance / 1000} km"), // For kilometers
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Map"),
        previousPageTitle: "Back",
      ),
      child: SafeArea(
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: _initialLocation,
          myLocationEnabled: true,
          mapType: MapType.normal,
          zoomGesturesEnabled: true,
          polylines: _polylines,
        ),
      ),
    );
  }
}
