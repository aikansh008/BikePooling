import 'package:bike_pooling/Utils/Constants/colors.dart';
import 'package:bike_pooling/Utils/Constants/sizes.dart';
import 'package:bike_pooling/common/bottomnavbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PhoneVerification extends StatelessWidget {
  const PhoneVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height:40),
              Text(
                "Phone verification",
                style: TextStyle(
                  fontSize: Sizes.fontSizeLg,
                  fontWeight: FontWeight.w700,
                ),
              ),
                        SizedBox(height: 10),
              Text("Enter your OTP code",style: TextStyle(color: Colors.blueGrey),),
              SizedBox(height: 30),
              Pinput(
                length: 5,
                defaultPinTheme: PinTheme(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onCompleted: (pin) {
                  // Handle the completed PIN here
                  print('Completed PIN: $pin');
                },
                onChanged: (pin) {
                  // Handle PIN change here if needed
                  print('Current PIN: $pin');
                },
              ),
              SizedBox(height: 10),
               Text.rich(
  TextSpan(
    text: "Didn't recieve code ? ",
    style: TextStyle(
      color: Colors.black, 
    ),
    children: <TextSpan>[
      TextSpan(
        text: ' Resend again',
        style: TextStyle(
          color: Colors.black, // Style for the "Sign Up" text
          fontWeight: FontWeight.bold, // Make "Sign Up" bold
        ),
        recognizer: TapGestureRecognizer()..onTap = () {
          
        },
      ),
    ],
  ),
),

Flexible(child: Container(),flex: 5,),
 InkWell(
  onTap: (){
     Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => NaviagtionMenu(), // Replace with the new screen you want to navigate to
  ),
);
  },
   child: Container(
                height: MediaQuery.of(context).size.height*0.055,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Center(
                    child: Text(
                  "Verify",
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
        ),
      ),
    );
  }
}
