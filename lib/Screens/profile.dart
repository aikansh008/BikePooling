import 'package:bike_pooling/Utils/Constants/colors.dart';
import 'package:flutter/material.dart';

class ProfileScreeen extends StatelessWidget {
  const ProfileScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back_ios_new,
            size: 10,
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Stack(children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 60,
                    ),
                    Positioned(top: 90, right: 2, child: Icon(Icons.abc))
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  ProfileContainer(hint: "Full Name"),
                  const SizedBox(height: 20),
                  ProfileContainer(hint: "+91 Your mobile number"),
                  const SizedBox(
                    height: 20,
                  ),
                  ProfileContainer(hint: "Email"),
                  const SizedBox(
                    height: 20,
                  ),
                  ProfileContainer(hint: "Street"),
                  const SizedBox(
                    height: 20,
                  ),
                  ProfileContainer(hint: "City"),
                  const SizedBox(
                    height: 20,
                  ),
                  ProfileContainer(hint: "District"),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.35,
                        decoration: BoxDecoration(
                            border: Border.all(color: ecolor.primary),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                            child: Text(
                          "Cancel",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )),
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.35,
                        decoration: BoxDecoration(
                            color: ecolor.primary,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                            child: Text(
                          "Save",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

// ignore: must_be_immutable
class ProfileContainer extends StatelessWidget {
  String hint;
  ProfileContainer({
    required this.hint,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height:40,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: TextFormField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.only(
                left: 5, bottom:6),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
