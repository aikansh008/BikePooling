import 'package:bike_pooling/Screens/ridedetails.dart';
import 'package:bike_pooling/Utils/Constants/sizes.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                              Navigator.pop(
          context,
          MaterialPageRoute(
            builder: (context) =>const  RideDetails(), // Replace with the new screen you want to navigate to
          ),
        );
                  },
                  child:const Icon(Icons.arrow_back_ios)),
               const Text(
                  "Back",
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
          title: const Text(
            " Help",
            style: TextStyle(
              fontSize: Sizes.fontSizeLg,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
      children: [
        HelpSection(title: "I have been charged higher than the estimated fare  ",),
        HelpSection(title: "Billing Related issue"),
        HelpSection(title: "I want to report an issue about the captain"),
        HelpSection(title: "Ride insurance "),
        HelpSection(title: "Covid-19 safety")
      ],
    )
    );
  }
}

// ignore: must_be_immutable
class HelpSection extends StatelessWidget {
  String title;
   HelpSection({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Colors.grey,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                  overflow: TextOverflow.visible, // Allow text to wrap
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16,),
          ],
        ),
        Divider(
          color: Colors.grey,
        )
      ],
    );
  }
}
