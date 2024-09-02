import 'package:bike_pooling/Screens/ridedetails.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ActivityCard extends StatelessWidget {
  String source;
  String Destination;
  String Price;
  String Status;
  ActivityCard(
      {required this.Destination,
      required this.Price,
      required this.source,
      required this.Status,
      super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return IntrinsicHeight(
      child: InkWell(
        onTap: (){
                   Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RideDetails(), // Replace with the new screen you want to navigate to
          ),
        );
        },
        child: Card(
          
          shadowColor: const Color.fromARGB(255, 127, 125, 125),
          elevation: 2.0,
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Source: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        source,
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  children: [
                    Text(
                      "Destination: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        Destination,
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\u20B9 " + Price,
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          Status,
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            color:Status=="Completed"? Colors.green:Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: screenWidth * 0.04,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
