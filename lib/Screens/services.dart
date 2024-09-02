import 'package:bike_pooling/Screens/drop-off.dart';
import 'package:bike_pooling/Utils/Constants/colors.dart';
import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Pick-up", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            SizedBox(height:20),
            Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 219, 216, 216),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Enter the full address",
                        hintStyle: TextStyle(
                            color: const Color.fromARGB(255, 77, 76, 76)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 10),
                      ),
                    ),
                  ),
              Flexible(child: Container(),flex: 5,),

                   Center(
                     child: InkWell(
                      onTap: (){
                         Navigator.pushReplacement(
                       context,
                       MaterialPageRoute(
                         builder: (context) => DropOff(), // Replace with the new screen you want to navigate to
                       ),
                     );
                      },
                       child: Container(
                                       height: MediaQuery.of(context).size.height*0.06,
                                       width: MediaQuery.of(context).size.width*0.7,
                                       child: Center(child: Text("Select",style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),)),
                                       decoration: BoxDecoration(
                                         color: ecolor.primary,
                                         borderRadius: BorderRadius.circular(5),
                                       ),
                                     ),
                     ),
                   ),
          ],
        ),
      )
    );

  }
}
