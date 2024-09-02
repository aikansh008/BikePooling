import 'package:bike_pooling/Screens/Activity.dart';
import 'package:bike_pooling/Screens/Wallet.dart';
import 'package:bike_pooling/Screens/profile.dart';
import 'package:bike_pooling/Screens/services.dart';
import 'package:bike_pooling/Utils/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';

class TripScreen extends StatefulWidget {
  @override
  _TripScreenState createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  late GoogleMapController mapController;
  Location _location = Location();
  bool notverified = false;
  double _originLatitude = 0.0, _originLongitude = 0.0;
  double _destLatitude = 37.3342983, _destLongitude = -122.0660055;

  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleApiKey = "YOUR_GOOGLE_MAPS_API_KEY"; // Replace with your API key
  int myIndex = 0;
  List<Widget> widgetlist = [
    TripScreen(),
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
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.close_sharp),
                  ],
                ),
                Divider(
                  color: Color(0xFFD8D8D8),
                  thickness: 2,
                ),
                notverified?
                Text(

                  "Your driver is coming in 5:00 min",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ): Text(

                  "Arrival at destination in 12 mins- 7.8 kms",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                Divider(
                  color: Color(0xFFD8D8D8),
                  thickness: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "OTP for this ride",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        OtpContainer(Num: "5"),
                        OtpContainer(Num: "4"),
                        OtpContainer(Num: "3"),
                        OtpContainer(Num: "1"),
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: Color(0xFFD8D8D8),
                  thickness: 2,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/Rectangle 553 (1).png"),
                        SizedBox(width: 5),
                        Column(
                          children: [
                            Text(
                              "John Doe",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15),
                            ),
                            Text("800m (5mins away)"),
                            Text("4.9 (531 reviews)"),
                          ],
                        )
                      ],
                    ),
                    Image.asset("assets/images/vehicle (1).png"),
                  ],
                ),
                Spacer(), // Pushes the buttons to the bottom
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex:notverified ? 3 :0,
                      child:  notverified? Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: ecolor.primary),
                        ),
                        child: Center(
                          child: Text(
                            "Call",
                            style: TextStyle(color: ecolor.primary),
                          ),
                        ),
                      ):
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: ecolor.primary),
                          color: ecolor.primary,
                        ),
                        child: Center(
                          child:Row(
                            children: [
                              Icon(Icons.share),
                              Text("Share your live location", style: TextStyle(fontWeight: FontWeight.w600),)
                            ],
                          )
                        ),
                      )
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: notverified? Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: ecolor.primary,
                            border: Border.all(color: ecolor.primary),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "Message",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ):
                      Container(
                        
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.red,
                           
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "SOS",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Route Map'),
          actions: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: _showBottomSheet,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  height: screenHeight * 0.5,
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
                const SizedBox(height: 50),
               
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
      polylineCoordinates.clear();
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      _addPolyLine();
    } else {
      print(result.errorMessage);
    }
  }
}

class OtpContainer extends StatelessWidget {
  final String Num;
  OtpContainer({
    required this.Num,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0),
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: ecolor.primary),
        child: Center(
          child: Text(
            Num,
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
