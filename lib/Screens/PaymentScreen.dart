import 'package:bike_pooling/Screens/Wallet.dart';
import 'package:bike_pooling/Screens/homescreen%20.dart';
import 'package:bike_pooling/Utils/Constants/colors.dart';
import 'package:bike_pooling/Utils/Constants/sizes.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

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
                    onTap: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const Wallet(), // Replace with the new screen you want to navigate to
                        ),
                      );
                    },
                    child: const Icon(Icons.arrow_back_ios)),
                const Text(
                  "Back",
                  style: TextStyle(fontSize: Sizes.fontSizeSm),
                ),
              ],
            ),
          ),
          title: const Text(
            "Amount",
            style: TextStyle(
              fontSize: Sizes.fontSizeLg,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: double.maxFinite),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter  Amount",
                      hintStyle: const TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.only(left: 5, bottom: 10),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Add payment method",
                    style: TextStyle(color: Color.fromRGBO(48, 79, 254, 1.0)),
                  )
                ],
              ),
              PaymentOptions(
                  cardNumber: "**** **** **** 8970", expiry: "Expires: 12/26", image:"assets/images/visa-icon-5.png"),
                  PaymentOptions(cardNumber: "**** **** **** 8970", expiry: "Expires: 12/26", image: "assets/images/mastercard-logo.png"),
                  PaymentOptions(cardNumber: "sample@gmail.com", expiry: "Expires: 12/26", image: "assets/images/paypal-logo-0.png"),
                  Flexible(child: Container(),flex: 5,),
 InkWell(
  onTap: () {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5),
  ),
  contentPadding: EdgeInsets.zero, // Removes default padding
  content: Container(
    width: MediaQuery.of(context).size.width * 0.9, // Set width
    height: MediaQuery.of(context).size.width * 0.9, // Set height equal to width to make it square
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/Group 6476.png"),
          SizedBox(height: 10),
          Text(
            "Add Successfully",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 5),
          Align(
            alignment: Alignment.center,
            child: Text("Your money has been added successfully")),
          SizedBox(height: 10),
          Text(
            "Amount",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            "\u20B9 504",
            style: TextStyle(
              fontSize: 40,
              color: Color.fromRGBO(90, 90, 90, 1.0).withOpacity(0.5),
            ),
          ),
        ],
      ),
    ),
  ),
  actions: [
    TextButton(
      onPressed: () {
        Navigator.pop(
          context,
          MaterialPageRoute(
            builder: (context) => MapScreen(), // Replace with your screen
          ),
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.055,
        width: MediaQuery.of(context).size.width ,
        decoration: BoxDecoration(
          color: ecolor.primary,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            "Back Home",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    ),
  ],
);

    },
  );
},
   child: Container(
                 height: MediaQuery.of(context).size.height*0.055,
                
                child: Center(
                    child: Text(
                  "Confirm",
                  style:
                      TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                )),
                decoration: BoxDecoration(
                  color: ecolor.primary,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
 ),
            Flexible(child: Container(),flex: 1,),
            ],
          ),
        ));
  }
}

// ignore: must_be_immutable
class PaymentOptions extends StatelessWidget {
  String cardNumber;
  String expiry;
  String image;
  PaymentOptions({
    required this.cardNumber,
    required this.expiry,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
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
              Expanded(flex: 1, child: Image.asset(image)),
              SizedBox(width: 10), // Responsive spacing
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cardNumber,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600), // Responsive font size
                    ),
                    Text(
                      expiry,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12, // Responsive font size
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
