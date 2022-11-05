import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class mapIntegration extends StatefulWidget {
  const mapIntegration({Key? key}) : super(key: key);
  @override
  State<mapIntegration> createState() => _mapIntegrationState();
}
class _mapIntegrationState extends State<mapIntegration> {
  @override
  Completer<GoogleMapController> _controller=Completer();
  static final CameraPosition _kGooglePlex=CameraPosition(
      target:LatLng(10.016759369372418, 76.34295536233581),
      zoom :14.4746);

  static final CameraPosition _kLake=CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(10.016759369372418, 76.34295536233581),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414
  );
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: _goToTheLake,
        label: Text("To The Lake"),
        icon: Icon(Icons.directions_boat),),
    );
  }
  Future<void> _goToTheLake() async{
    final GoogleMapController controller =await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
