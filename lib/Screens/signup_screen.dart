import 'package:bike_pooling/Screens/setpassword.dart';
import 'package:bike_pooling/Utils/Constants/colors.dart';
import 'package:bike_pooling/Utils/Constants/sizes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Icon(
        Icons.arrow_back_ios,
        size: 15,
      )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                "Signup with your email or phone number",
                style: TextStyle(fontSize: Sizes.fontSizeMd),
              ),
              SizedBox(height: 5),
              Container(
            height:50,
                child: Center(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Email or Phone",
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.only(bottom: 0, left: 5),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height:50,
                child: Center(
                  child: TextFormField(
                    obscuringCharacter: "*",style: TextStyle(fontWeight: FontWeight.bold),
                    
                    obscureText: true,
                    cursorHeight: 20,
                    decoration: InputDecoration(
                      
                      suffixIcon: Icon(Icons.visibility_off),
                      hintText: "Password",
                      
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.only(top:15, left: 5),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We’ll call or text you to confirm your number.Standard message and data apply.",
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: (){
                    Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SetPassword(), // Replace with the new screen you want to navigate to
          ),
        );
                },
                child: Container(
                 height:50,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Center(
                      child: Text(
                    "Signup",
                    style:
                        TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                  )),
                  decoration: BoxDecoration(
                    color: ecolor.primary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: 10),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0), // Space around the text
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
              SizedBox(height: 20),
              login_methods(text: "Signup with Gmail", path: "hii"),
              SizedBox(height: 20),
              login_methods(text: "Signup with Facebook", path: "hii"),
              SizedBox(height: 20),
              login_methods(text: "Signup with Apple Id", path: "hii"),
              SizedBox(height: 20),
              Text.rich(
          TextSpan(
            text: "Don't have an account? ",
            style: TextStyle(
        color: Colors.black, // Style for the first part of the text
            ),
            children: <TextSpan>[
        TextSpan(
          text: 'Sign Up',
          style: TextStyle(
            color: Colors.black, // Style for the "Sign Up" text
            fontWeight: FontWeight.bold, // Make "Sign Up" bold
          ),
          recognizer: TapGestureRecognizer()..onTap = () {
            // Action when "Sign Up" is tapped
            // For example, navigate to the sign-up page
          },
        ),
            ],
          ),
        )
        
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class login_methods extends StatelessWidget {
  String text;
  String path;
  login_methods({
    required this.text,
    required this.path,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     height:50,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
