import 'package:bike_pooling/Screens/email_verification.dart';
import 'package:bike_pooling/Utils/Constants/colors.dart';
import 'package:bike_pooling/Utils/Constants/sizes.dart';
import 'package:flutter/material.dart';

class SetPassword extends StatelessWidget {
  const SetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height:40),
              Text(
                "Set Password",
                style: TextStyle(
                  fontSize: Sizes.fontSizeLg,
                  fontWeight: FontWeight.w700,
                ),
              ),
                        SizedBox(height: 10),
              Text("Set Your Password ",style: TextStyle(color: Colors.blueGrey),),
              SizedBox(height: 30),
             Container(
             height:50,
              child: Center(
                child: TextFormField(
                  obscureText: true,
                    obscuringCharacter: "*",style: TextStyle(fontWeight: FontWeight.bold),
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
            SizedBox(height: 10),
            Container(
              height: 50,
              child: Center(
                child: TextFormField(
                  obscuringCharacter: "*",style: TextStyle(fontWeight: FontWeight.bold),
                  
                  obscureText: true,
                  cursorHeight: 20,
                  decoration: InputDecoration(
                    
                    suffixIcon: Icon(Icons.visibility_off),
                    hintText: "Confirm Password",
                    
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.only(top: 15, left: 5),
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
             Text("Atleast 1 number or a special character", style: TextStyle(color: Colors.blueGrey,fontSize: Sizes.fontSizeSm),),

Flexible(child: Container(),flex: 5,),
 InkWell(
  onTap: (){
      Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => EmailVerification(), 
  ),
);
  },
   child: Container(
                height:50,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Center(
                    child: Text(
                  "Register",
                
                  style:
                      TextStyle(color: Colors.black, fontWeight: FontWeight.w700,
                       ),
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
