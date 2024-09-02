import 'package:bike_pooling/Screens/Activity.dart';
import 'package:bike_pooling/Screens/Invoice.dart';
import 'package:bike_pooling/Screens/helpscreen.dart';
import 'package:bike_pooling/Utils/Constants/colors.dart';
import 'package:bike_pooling/Utils/Constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class RideDetails extends StatefulWidget {
  const RideDetails({super.key});

  @override
  State<RideDetails> createState() => _RideDetailsState();
}

class _RideDetailsState extends State<RideDetails> {
  double rating = 3.5;
  int starCount = 5;
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
            builder: (context) =>const  Activity(), // Replace with the new screen you want to navigate to
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
            "Ride details",
            style: TextStyle(
              fontSize: Sizes.fontSizeLg,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
           const   SizedBox(width: double.infinity),
             const CircleAvatar(
                radius: 35,
                backgroundColor: ecolor.primary,
              ),
            const  SizedBox(
                height: 10,
              ),
             const Text(
                "John Doe",
                style: TextStyle(fontSize: Sizes.fontSizeLg),
              ),
              StarRating(
                size: 20.0,
                rating: rating,
                color: Colors.yellow,
                borderColor: Colors.grey,
                allowHalfRating: true,
                starCount: starCount,
                onRatingChanged: (rating) => setState(() {
                  this.rating = rating;
                }),
              ),
             const SizedBox(height:10),
           const   Divider(
                color: Colors.grey,
                height:0.2,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    DetailRow(title:"Vehicle Type", Subtitle: "Scooty",),
                    DetailRow(title: "Date of Ride", Subtitle: "17 Aug 2024,08:54 AM"),
                    DetailRow(title: "Ride ID", Subtitle: "TH24154545457436396"),
                    DetailRow(title: "Status", Subtitle: "Done"),
                    DetailRow(title: "Total Amount", Subtitle: "\u20B9 504"),
                    DetailRow(title: "Payment Method", Subtitle:"Cash")
                    ],
                ),
              ),
            const  Divider(
                color:Colors.grey,
                height: 0.2,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                  const  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Source: ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              Flexible(
                
                child: Text(
          "13/202 street Number 2, Khushi Vihar, Patarkar Colony, Mansarovar-302020",
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
         const SizedBox(height:10),
        const   Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Destination: ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              Flexible(
                
                child: Text(
          "Jaipur National University Near RTO jagatpura, khonagorian, jagatpura-302017",
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        const  SizedBox(height:30),
          Row(
            children: [
              Expanded(
                child: Container(
          height: 40,
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(color: Colors.blueGrey),
              top: BorderSide(color: Colors.blueGrey),
              bottom: BorderSide(color: Colors.blueGrey),
              right: BorderSide(color: Colors.blueGrey),
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              bottomLeft: Radius.circular(5),
            ),
          ),
          child:const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "15.78 Km",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "DISTANCE",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 156, 152, 152),
                ),
              ),
            ],
          ),
                ),
              ),
              Expanded(
                child: Container(
          height: 40,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.blueGrey),
              bottom: BorderSide(color: Colors.blueGrey),
              right: BorderSide(color: Colors.blueGrey),
            ),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "30.50 mins",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "DURATION",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 156, 152, 152),
                ),
              ),
            ],
          ),
                ),
              ),
            ],
          ),
        const  SizedBox(height:30),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: (){

                  },
                  child: InkWell(
                    onTap: (){
                       Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>const  InvoiceScreen(), // Replace with the new screen you want to navigate to
          ),
        );
                    },
                    child: Container(
                              height: 40,
                              decoration:const  BoxDecoration(
                                border: Border(
                                  left: BorderSide(color: Colors.blueGrey),
                                  top: BorderSide(color: Colors.blueGrey),
                                  bottom: BorderSide(color: Colors.blueGrey),
                                  right: BorderSide(color: Colors.blueGrey),
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                ),
                                color: ecolor.primary
                              ),
                              child:const  Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                    "INVOICE",
                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                 
                                ],
                              ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: (){
                     Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>const  HelpScreen(), // Replace with the new screen you want to navigate to
          ),
        );
                  },
                  child: Container(
                            height: 40,
                            decoration:const  BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Colors.blueGrey),
                                bottom: BorderSide(color: Colors.blueGrey),
                                right: BorderSide(color: Colors.blueGrey),
                              ),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
                            ),
                            child:const Center(
                              child: Text(
                                "HELP",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                  ),
                ),
              ),
            ],
          )
                  ],
                ),
              )
            ],
          ),
        )
        );
  }
}

// ignore: must_be_immutable
class DetailRow extends StatelessWidget {
  String title;
    // ignore: non_constant_identifier_names
    String Subtitle;
   DetailRow({
    required this.title,
    // ignore: non_constant_identifier_names
    required this.Subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Flexible(
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        overflow: TextOverflow.ellipsis,
      ),
    ),
   const SizedBox(width: 8.0), // Add some spacing between the title and subtitle
    Flexible(
      child: Text(
        Subtitle,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Subtitle == "Done" ? Colors.green : Colors.black,
        ),
        textAlign: TextAlign.right,
        overflow: TextOverflow.ellipsis,
      ),
    ),
  ],
)
    );
  }
}
