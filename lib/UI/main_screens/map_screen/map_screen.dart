import 'package:covid19/UI/main_screens/map_screen/directions_repository.dart';
import 'package:covid19/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'directions_model.dart';

class MapScreen extends StatefulWidget {
  static String routeName = "/map_screen";

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static CameraPosition _intialCameraPosition =
      CameraPosition(zoom: 11.5, target: LatLng(30.033333, 31.233334));
  GoogleMapController _googleMapController;
  Marker _origin;
  Marker _destination;
  Directions _info;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // //   title: Text("Map"),
      // //   actions: [
      // //     if (_origin != null)
      // //       TextButton(
      // //           child: Text("ORIGIN"),
      // //           onPressed: () => _googleMapController.animateCamera(
      // //               CameraUpdate.newCameraPosition(CameraPosition(
      // //                   target: _origin.position, zoom: 14.5, tilt: 50.0)))),
      // //     if (_destination != null)
      // //       TextButton(
      // //           child: Text("DESTINATION"),
      // //           onPressed: () => _googleMapController.animateCamera(
      // //               CameraUpdate.newCameraPosition(CameraPosition(
      // //                   target: _destination.position,
      // //                   zoom: 14.5,
      // //                   tilt: 50.0)))),
      // //   ],
      // // ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            initialCameraPosition: _intialCameraPosition,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            onMapCreated: (controller) => _googleMapController = controller,
            markers: {
              if (_origin != null) _origin,
              if (_destination != null) _destination
            },
            onLongPress: _addMarker,
          ),
          // Container(
          //   height: 10.h,
          //   child: TextField(
          //     decoration: InputDecoration(
          //       hintText: "Search",
          //       disabledBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(3.h),
          //           borderSide: BorderSide(
          //             color: MColors.covidMain,
          //           )),
          //       enabledBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(3.h),
          //           borderSide: BorderSide(
          //             color: MColors.covidMain,
          //           )),
          //     ),
          //   ),
          // ),
        ],
      ),
      floatingActionButton: buildRepositionFloatingActionButton(),
    );
  }

  FloatingActionButton buildRepositionFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: MColors.covidThird,
      foregroundColor: MColors.covidMain,
      child: Icon(Icons.center_focus_strong),
      onPressed: () => _googleMapController.animateCamera(_info != null
          ? CameraUpdate.newLatLngBounds(_info.bounds, 100)
          : CameraUpdate.newCameraPosition(_intialCameraPosition)),
    );
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  void _addMarker(LatLng position) async {
    if ((_origin == null) || (_origin != null && _destination != null)) {
      //Origin is not set or origin,destination are both set ==> set origin
      setState(() {
        _origin = Marker(
            markerId: const MarkerId("origin"),
            infoWindow: const InfoWindow(title: 'Origin'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            position: position);
      });
      _destination = null;
      _info = null;
    } else {
      //origin is already set ==> setbdestination
      setState(() {
        _destination = Marker(
            markerId: const MarkerId("destination"),
            infoWindow: const InfoWindow(title: 'Destination'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            position: position);
      });

      // get directions
      final directions = await DirectionRepository()
          .getDirection(origin: _origin.position, destination: position);
      setState(() => _info = directions);
    }
  }
}
