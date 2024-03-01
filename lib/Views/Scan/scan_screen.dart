
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:grade_project/layout/Home_Screen/home_screen.dart';

import 'package:grade_project/shared/components/components.dart';

import '../Login_Screen/login_screen.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:  AppBar(),
        body:  SingleChildScrollView(
          child: Column(

      children: [
          const Image(image: AssetImage("asset/image/bus_loction2.png")),
           const SizedBox(height: 40,),


           Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,

             children: [
               const Text(" مرحبا ايها السائق   "),
               const SizedBox(height: 10),
          const Text("جاهز للعمل"),
          const SizedBox(height: 10),
               defaultButton(isUppercase: true,text: "اضغط هنا ",width: 300,height: 30,
                    pressed: () {
                      FlutterBarcodeScanner.scanBarcode(
                          "",// color Line
                          "cancel",//button
                          true,//flash camera

                          ScanMode.BARCODE
                      );
                    },),
             ],
           ),


            ],
          ),
        ),


    floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context,
              builder: (context) => AlertDialog(
                title: const Text("يوم سعيد يا سائق"),
                content: const Text("للخروج من الصفحة "),
                actions: [
                 Row(
                   children: [
                     Column(
                       children: [
                         IconButton(onPressed: () {
                           navigateStop(context,  const HomeScreen());
                         },
                             icon: const Icon(Icons.home)),
                         const Text("صفحة رئيسية")
                       ],
                     ),
                     const Spacer(),
                     Column(
                       children: [
                         IconButton(onPressed: () {
                           navigateStop(context, LoginScreen());
                         },
                             icon:const Icon(Icons.logout) ),
                         const Text("صفحة التسجيل")
                       ],
                     ),
                   ],
                 )
                ],
              ),);
        },child: const Icon(Icons.door_back_door_outlined)

      ),
    );

  }
}
