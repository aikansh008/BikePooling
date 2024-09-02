import 'package:bike_pooling/Screens/Routes_screen.dart';
import 'package:bike_pooling/Utils/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PassengerDropoff extends StatefulWidget {
  const PassengerDropoff({super.key});

  @override
  _PassengerDropoffState createState() => _PassengerDropoffState();
}

class _PassengerDropoffState extends State<PassengerDropoff> {
  late GoogleMapController mapController;
  final Map<MarkerId, Marker> markers = {};
  final Map<PolylineId, Polyline> polylines = {};
  final List<LatLng> polylineCoordinates = [];
  final PolylinePoints polylinePoints = PolylinePoints();
  String googleApiKey =
      "AIzaSyAJxibthoO8j0s7MJk74KaBBagjcdhxvT4";
  double _originLatitude = 37.7749, _originLongitude = -122.4194;
  double _destLatitude = 37.7749, _destLongitude = -122.4194;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Route Map'),
       
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Where would you like to drop off passengers?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 219, 216, 216),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Enter the full address",
                    hintStyle: TextStyle(color: Color.fromARGB(255, 77, 76, 76)),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(_originLatitude, _originLongitude),
                    zoom: 14.5,
                  ),
                  myLocationEnabled: true,
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
              
         SizedBox(height:120),

                   Center(
                     child: InkWell(
                      onTap: (){
                         Navigator.pushReplacement(
                       context,
                       MaterialPageRoute(
                         builder: (context) => RoutesScreen(), // Replace with the new screen you want to navigate to
                       ),
                     );
                      },
                       child: Container(
                                       height: MediaQuery.of(context).size.height*0.06,
                                       width: MediaQuery.of(context).size.width*0.7,
                                       child: Center(child: Text("Select",style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),)),
                                       decoration: BoxDecoration(
                                         color: ecolor.primary,
                                         borderRadius: BorderRadius.circular(5),
                                       ),
                                     ),
                     ),
                   ),
            ],
          ),
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
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
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
      _addPolyLine();
    } else {
      print(result.errorMessage);
    }
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

  void _showBottomSheet() {
    // Define your bottom sheet display here
  }
}

class RecentLocation extends StatelessWidget {
  final String type;
  final String location;
  final String distance;

  const RecentLocation({
    required this.type,
    required this.location,
    required this.distance,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on),
                  Text(type,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5A5A5A))),
                ],
              ),
              Text(distance,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5A5A5A))),
            ],
          ),
          Text(
            location,
            style: TextStyle(color: Color(0xFF5A5A5A).withOpacity(0.5)),
          ),
        ],
      ),
    );
  }
}
