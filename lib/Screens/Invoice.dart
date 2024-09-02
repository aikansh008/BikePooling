import 'package:bike_pooling/Screens/Activity.dart';
import 'package:bike_pooling/Utils/Constants/colors.dart';
import 'package:bike_pooling/Utils/Constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
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
            " Invoice",
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
              SizedBox(height: 20,),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                children: [
                  DetailRow(title:"Ride Charges", Subtitle: "\u20B9 504",),
                  DetailRow(title:"Convienence Charges and Taxes", Subtitle: "\u20B9 24",),
                ],
               ),
             ),
            Divider(
                color:Colors.grey,
                height: 0.2,
              ),
              SizedBox(height: 20,),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: DetailRow(title:"Total", Subtitle: "\u20B9 528",),
               ),
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
