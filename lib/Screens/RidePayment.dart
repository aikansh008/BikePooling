import 'package:bike_pooling/Screens/tripScreen.dart';
import 'package:bike_pooling/Utils/Constants/sizes.dart';
import 'package:bike_pooling/Utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class RidePayment extends StatelessWidget {
  const RidePayment({super.key});

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
                            TripScreen(), // Replace with the new screen you want to navigate to
                      ),
                    );
                  },
                  child: const Icon(Icons.arrow_back_ios)),
              const Text(
                "Back",
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
        title: const Text(
          "Payment",
          style: TextStyle(
            fontSize: Sizes.fontSizeLg,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/images/Rectangle 553 (1).png"),
                SizedBox(width: 5),
                Column(
                  children: [
                    Text(
                      "John Doe",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    Text("800m (5mins away)"),
                    Text("4.9 (531 reviews)"),
                  ],
                ),
                Image.asset("assets/images/vehicle (1).png"),
              ],
            ),
            SizedBox(height: Sizes.spaceBtwItems),
            Text(
              "Charge",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            SizedBox(
              height: Sizes.spaceBtwSections,
            ),
            PriceWidget(
              Price: "480",
              heading: "Ride Details",
            ),
            SizedBox(height: 5),
            PriceWidget(
              Price: "24",
              heading: "GST(5%)",
            ),
            Divider(
              color: Color(0xFFD8D8D8),
              thickness: 2,
            ),
            SizedBox(
              height: Sizes.spaceBtwSections,
            ),
            PriceWidget(Price: "504", heading: "Total"),
            SizedBox(
              height: Sizes.defaultSpace,
            ),
            Text(
              "Select Payment Method",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: Sizes.spaceBtwInputFields),
            //PaymentCard(image: "",)
          ],
        ),
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  String image;
  String Method;
  PaymentCard({
    required this.image,
    required this.Method,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Row(
        children: [
          Image.asset(image),
          SizedBox(width: 40),
          Text(
          Method,
            style: TextStyle(fontWeight: FontWeight.w800),
          )
        ],
      ),
    );
  }
}

class PriceWidget extends StatelessWidget {
  String heading;
  String Price;
  PriceWidget({
    required this.Price,
    required this.heading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(heading, style: TextStyle(fontWeight: FontWeight.w600)),
        Text("\u20B9" + Price)
      ],
    );
  }
}
