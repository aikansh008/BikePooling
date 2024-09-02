import 'package:bike_pooling/Screens/tripScreen.dart';
import 'package:bike_pooling/Utils/Constants/colors.dart';
import 'package:flutter/material.dart';

class SelectVehicle extends StatelessWidget {
  const SelectVehicle({super.key});

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(0), // Rectangular shape
  ),
  content: Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.15, // Responsive height
          width: MediaQuery.of(context).size.width * 0.4, // Responsive width
          child: Image.asset("assets/images/check-circle.1.png"),
        ),
      ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.02), // Responsive spacing
      Text(
        "Booking Successful",
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.05, // Responsive font size
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.01),
      Text(
        "Your booking has been confirmed. Driver will pick you up in 5 minutes.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 10// Responsive font size
        ),
      ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.05), // Responsive spacing
      Row(
        children: [
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06, // Responsive button height
              margin: const EdgeInsets.only(right: 8.0), // Space between buttons
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: TextButton(
                onPressed: () {
                   Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => TripScreen(), 
  ),
);
                },
                child:const Text(
                  "Cancel",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 10, // Responsive font size
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06, 
              margin: const EdgeInsets.only(left: 8.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: TextButton(
                onPressed: () {
                   Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => TripScreen(), // Replace with the new screen you want to navigate to
  ),
);
                },
                child: Text(
                  "Done",
                  style: TextStyle(
                    color: ecolor.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 10, 
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  ),
);
      },
    );
  }

  void _handleButtonTap(BuildContext context) {
    Navigator.pop(context); // Pop the current screen
    _showSuccessDialog(context); // Show success dialog on the previous screen
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "Select your Vehicle",
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildVehicleContainer(
                  screenHeight, screenWidth, "Bike", "assets/images/vehicle (1).png"),
              _buildVehicleContainer(
                  screenHeight, screenWidth, "Scooty", "assets/images/scooter_PNG11328.png"),
            ],
          ),
          SizedBox(height: screenHeight * 0.05), // Adjust spacing
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding
            child: Container(
              height: screenHeight * 0.4, // Adjust height for responsiveness
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFFFFE24F).withOpacity(0.7),
                  border: Border.all(
                    width: 2,
                    color: ecolor.primary,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding
                child: Column(
                  children: [
                    Text(
                      "Driver Preference",
                      style: TextStyle(
                        fontSize: screenWidth * 0.05, // Responsive font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02), // Adjust spacing
                    _buildPreferenceButton(context, "Male"),
                    SizedBox(height: screenHeight * 0.02), // Adjust spacing
                    _buildPreferenceButton(context, "Female"),
                    SizedBox(height: screenHeight * 0.02), // Adjust spacing
                    _buildPreferenceButton(context, "No Preference"),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // Helper method to build vehicle container
  Widget _buildVehicleContainer(double screenHeight, double screenWidth, String label, String imagePath) {
    return Container(
      height: screenHeight * 0.16,
      width: screenWidth * 0.4,
      decoration: BoxDecoration(
        color: Color(0xFFFFE24F).withOpacity(0.7),
        border: Border.all(
          width: 2,
          color: ecolor.primary,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.02),
              child: Container(
                height: screenHeight * 0.1,
                width: screenWidth * 0.2,
                child: Image.asset(imagePath),
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build preference button
  Widget _buildPreferenceButton(BuildContext context, String label) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => _handleButtonTap(context), // Handle button tap
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: ecolor.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
