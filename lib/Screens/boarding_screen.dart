import 'package:bike_pooling/Screens/login_screen.dart';
import 'package:bike_pooling/Screens/signup_screen.dart';
import 'package:bike_pooling/Utils/Constants/colors.dart';
import 'package:bike_pooling/Utils/Constants/sizes.dart';
import 'package:flutter/material.dart';

class BoardingScreen extends StatelessWidget {
  const BoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("TRIPHOPPER",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
            SizedBox(height: Sizes.sm),
            Text(
              "Seamless journeys at your fingertips! Experience the future of transportation with our revolutionary ride app",
              style: TextStyle(fontSize: Sizes.fontSizeSm),
            ),
            SizedBox(
              height: 100,
            ),
            InkWell(
              onTap: (){
                Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => LoginScreen(), // Replace with the new screen you want to navigate to
  ),
);
              },
              child: Container(
                height: MediaQuery.of(context).size.height*0.06,
                width: MediaQuery.of(context).size.width*0.7,
                child: Center(child: Text("Login",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),)),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(height:10),
           Row(
  children: [
    Expanded(
      child: Divider(
        indent: 50,
        endIndent: 3, // Small space between text and divider
        color: Colors.black,
        thickness: 1.5,
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0), // Space around the text
      child: Text(
        'or',
        style: TextStyle(
          color: Colors.black, // Text color
          fontWeight: FontWeight.bold, // Text weight
        ),
      ),
    ),
    Expanded(
      child: Divider(
        indent: 5,
        endIndent: 50, // Small space between text and divider
        color: Colors.black,
        thickness: 1.5,
      ),
    ),
  ],
),
SizedBox(height:10),
 InkWell(
  onTap: (){
      Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => SignupScreen(), // Replace with the new screen you want to navigate to
  ),
);
  },
   child: Container(
                 height: MediaQuery.of(context).size.height*0.06,
                width: MediaQuery.of(context).size.width*0.7,
                child: Center(child: Text("Sign Up",style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),)),
                decoration: BoxDecoration(
                  color: ecolor.primary,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
 ),

          ],
        ),
      ),
    ));
  }
}
