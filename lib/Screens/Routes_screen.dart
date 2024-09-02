import 'package:bike_pooling/Screens/Activity.dart';
import 'package:bike_pooling/Screens/Wallet.dart';
import 'package:bike_pooling/Screens/profile.dart';
import 'package:bike_pooling/Screens/select_vehicle.dart';
import 'package:bike_pooling/Screens/services.dart';
import 'package:bike_pooling/Utils/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';

class RoutesScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<RoutesScreen> {
  late GoogleMapController mapController;
  Location _location = Location();
  bool _isChecked = false; 
  double _originLatitude = 0.0, _originLongitude = 0.0;
  double _destLatitude = 37.3342983,
      _destLongitude = -122.0660055; // Default destination

  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleApiKey =
      "AIzaSyAJxibthoO8j0s7MJk74KaBBagjcdhxvT4"; // Replace with your API key
  int myIndex = 0;
  List<Widget> widgetlist = [
    RoutesScreen(),
    Services(),
    Wallet(),
    Activity(),
    ProfileScreeen()
  ];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    var locationData = await _location.getLocation();
    setState(() {
      _originLatitude = locationData.latitude ?? 0.0;
      _originLongitude = locationData.longitude ?? 0.0;
      _addMarker(LatLng(_originLatitude, _originLongitude), "origin",
          BitmapDescriptor.defaultMarker);
    });
    _updateMapLocation();
    _getPolyline();
  }

  void _updateMapLocation() {
    mapController.animateCamera(
      CameraUpdate.newLatLngZoom(
        LatLng(_originLatitude, _originLongitude),
        14.5,
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 219, 216, 216),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.gps_fixed),
                      hintText: "From",
                      hintStyle:
                          TextStyle(color: const Color.fromARGB(255, 77, 76, 76)),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 13),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
            
               
             
          
                   InkWell(
                    onTap: (){
                          Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SelectVehicle(),
          ),
        );
                    },
                    child: Center(child: Text("Next")))
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Route Map'),
        
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(_originLatitude, _originLongitude),
                      zoom: 14.5,
                    ),
                    myLocationEnabled: true,
                    tiltGesturesEnabled: true,
                    compassEnabled: true,
                    scrollGesturesEnabled: true,
                    zoomGesturesEnabled: true,
                    onMapCreated: _onMapCreated,
                    markers: Set<Marker>.of(markers.values),
                    polylines: Set<Polyline>.of(polylines.values),
                    onTap: (LatLng position) {
                      setState(() {
                        _destLatitude = position.latitude;
                        _destLongitude = position.longitude;
                        markers[MarkerId("destination")] = Marker(
                          markerId: MarkerId("destination"),
                          icon: BitmapDescriptor.defaultMarkerWithHue(90),
                          position: position,
                        );
                      });
                      _getPolyline();
                    },
                  ),
                ),
                SizedBox(height: 50),
                   Text("What is your route", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 25),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        
                        children: [
                          Text("47  min -No tolls", style: TextStyle(fontWeight: FontWeight.w600),),
                          Text("24 km - Noida Bypass Flyover",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),)
                        ],
                      ),
                      Checkbox(

focusColor: ecolor.primary,              value: _isChecked, // Current state of the checkbox
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value ?? false; // Update the state when checkbox is toggled
                });
              },
            ),
                    ],
                   ),
                   SizedBox(height:20),
                     Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        
                        children: [
                          Text("46  min - No tolls", style: TextStyle(fontWeight: FontWeight.w600),),
                          Text("28 km - NH 334C and Delhi Rd",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),)
                        ],
                      ),
                      Checkbox(

focusColor: ecolor.primary,              value: _isChecked, // Current state of the checkbox
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value ?? false; // Update the state when checkbox is toggled
                });
              },
            ),
                    ],
                   )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker = Marker(
      markerId: markerId,
      icon: descriptor,
      position: position,
    );
    markers[markerId] = marker;
  }

  void _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.blue,
      width: 6,
      points: polylineCoordinates,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  void _getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: googleApiKey,
      request: PolylineRequest(
        origin: PointLatLng(_originLatitude, _originLongitude),
        destination: PointLatLng(_destLatitude, _destLongitude),
        mode: TravelMode.driving,
      ),
    );

    if (result.points.isNotEmpty) {
      polylineCoordinates.clear(); // Clear previous coordinates
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      _addPolyLine();
    } else {
      print(result.errorMessage); // Print error message if any
    }
  }
}

// ignore: must_be_immutable
class RecentLocation extends StatelessWidget {
  String Type;
  String Location;
  String Distance;
  RecentLocation({
    required this.Type,
    required this.Location,
    required this.Distance,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on),
                  Text(Type,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5A5A5A)))
                ],
              ),
              Text(Distance,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5A5A5A)))
            ],
          ),
          Text(
           Location,
            style: TextStyle(color: Color(0xFF5A5A5A).withOpacity(0.5)),
          )
        ],
      ),
    );
  }
}
