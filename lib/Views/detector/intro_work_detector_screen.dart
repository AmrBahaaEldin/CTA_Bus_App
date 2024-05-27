import 'package:flutter/material.dart';

import '../../shared/components/const.dart';
import '../../shared/styles/log_app.dart';



class IntroDetectorScreen extends StatefulWidget {

  const IntroDetectorScreen({Key? key}) : super(key: key);




  @override
  State<IntroDetectorScreen> createState() => _DriverScreenState();
}

class _DriverScreenState extends State<IntroDetectorScreen> {

  final ImportComponents importComponents=ImportComponents();
  final IconApp iconApp=IconApp();
  final LogApp logApp=LogApp();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    //final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisSize: MainAxisSize.min,


      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(image:logApp.driverImageHome(),width: screenWidth * 0.8),
        ),
        const SizedBox(height: 120,),
        Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            width: 300,

            decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.blue),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("كمسري :", style: TextStyle(color: Colors.white),),
                    SizedBox(width: 10),
                    Text("ابراهيم", style: TextStyle(color: Colors.white),),

                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("رقم الاتوبيس :",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    Text("50",
                      style: TextStyle(color: Colors.white),),

                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(" رقم اللوح :",
                      style: TextStyle(color: Colors.white),),
                    SizedBox(width: 10),
                    Text("ا,س,4,5,6",
                      style: TextStyle(color: Colors.white),),


                  ],
                ),






              ],
            ),
          ),
        ),


      ],
    );

  }
}
class DriverWork {
  String name;
  int busNumber;
  List<String> plateNumber;
  // DateTime dateWork;
  // bool isEditing;

  DriverWork({
    required this.name,
    required this.busNumber,
    required this.plateNumber,
    // required this.dateWork,
    // this.isEditing = false,
  });
}

