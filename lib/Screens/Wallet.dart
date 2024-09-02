import 'package:bike_pooling/Screens/PaymentScreen.dart';
import 'package:bike_pooling/Utils/Constants/colors.dart';
import 'package:bike_pooling/Utils/Constants/sizes.dart';
import 'package:flutter/material.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(Icons.arrow_back_ios),
                const Text(
                  "Back",
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
          title: const Text(
            " Wallet",
            style: TextStyle(
                fontSize: Sizes.fontSizeLg, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                //width: double.infinity,
                height: 100,
                child: Container(
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset(
                            "assets/images/account_balance_wallet.png",
                            height: MediaQuery.of(context).size.height *
                                0.1, // Adjust image height based on screen size
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .end, // Align text to the start
                              children: [
                                Text(
                                  "\u20B9 700",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20, // Responsive font size
                                  ),
                                ),
                                SizedBox(height: 10),
                                Flexible(
                                  child: Text(
                                    "Available Balance",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15, // Responsive font size
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ecolor.primary,
                  ),
                  color: Color.fromRGBO(255, 213, 3, 1.0).withOpacity(0.2),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Distribute space evenly between children
                children: [
                  Expanded(
                    flex: 1, // Adjust flex values to control space allocation
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>const  PaymentScreen(), // Replace with the new screen you want to navigate to
          ),
        );
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment
                            .center, // Center the text inside the container
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ecolor.primary,
                        ),
                        child: Text(
                          "Pay",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500 // Responsive font size
                              ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      width:
                          10), // Optional, for adding some space between the containers
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ecolor.primary,
                      ),
                      child: Text(
                        "Add Money",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transactions",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.green,
                        fontSize: 13),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
           TranscationCard(name: "Aikansh Tiwari", time: "Today at 09:00 am", Status: "recieved", amount: "600"),
           TranscationCard(name: "Aikansh Tiwari", time: "Today at 08:00 am", Status: "given", amount: "528"),
           TranscationCard(name: "Aikansh Tiwari", time: "Yesterday at 06:30 pm", Status: "recieved", amount: "140"),
                      TranscationCard(name: "Aikansh Tiwari", time: " at 10:30 pm", Status: "given", amount: "750")


            ],
          ),
        ));
  }
}

// ignore: must_be_immutable
class TranscationCard extends StatelessWidget {
  String name;
  String time;
  String Status;
  String amount;
  TranscationCard({
    required this.name,
    required this.time,
    required this.Status,
    required this.amount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1, // Responsive height
        decoration: BoxDecoration(
          border: Border.all(
            color: ecolor.primary,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: EdgeInsets.all(
              MediaQuery.of(context).size.width * 0.02), // Responsive padding
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: CircleAvatar(
                  backgroundColor:
                  Status=="recieved"?
                      Color.fromRGBO(3, 153, 0, 1.0).withOpacity(0.5):Color.fromRGBO(255, 0, 0, 1.0).withOpacity(0.3),
                  radius: 20, // Responsive radius
                  child: Transform.rotate(
                    angle:  Status=="recieved"? 270:90, // Convert degrees to radians
                    child: Icon(Icons.arrow_back,
                        color: Status=="recieved"? Color.fromRGBO(3, 153, 0, 1.0): Color.fromRGBO(255, 0, 0, 1.0)),
                  ),
                ),
              ),
              SizedBox(width: 5), // Responsive spacing
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600), // Responsive font size
                    ),
                    SizedBox(height: 2), // Responsive spacing
                    Text(
                      time,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12, // Responsive font size
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "\u20B9"+amount,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16, // Responsive font size
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 