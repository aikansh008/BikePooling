import 'package:bike_pooling/Utils/Constants/colors.dart';
import 'package:bike_pooling/Widget/activitycard.dart';
import 'package:flutter/material.dart';

class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenHeight * 0.25,
        backgroundColor: ecolor.primary,
        title: Column(
          children: [
            Text(
              "Activity",
              style: TextStyle(
                fontSize: screenWidth * 0.08,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.02),
          child: Column(
            children: [
              ActivityCard(Destination: "JNU jaipur, Near RTO, Jagatpura ", Price: "539", source: "Khushi vihar, Patarkar Colony",Status: "Completed",),
               ActivityCard(Destination: "JNU jaipur, Near RTO, Jagatpura ", Price: "599", source: "Khushi vihar, Patarkar Colony",Status: "Cancelled",),
                ActivityCard(Destination: "JNU jaipur, Near RTO, Jagatpura ", Price: "1539", source: "Khushi vihar, Patarkar Colony",Status: "Completed",),
                 ActivityCard(Destination: "JNU jaipur, Near RTO, Jagatpura ", Price: "739", source: "Khushi vihar, Patarkar Colony",Status: "Cancelled",)
            ],
          )
        ),
      ),
    );
  }
}
