import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/Home_Screen/home_screen.dart';
import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/state.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/custom_icon.dart';
import '../Login_Screen/login_screen.dart';


class DriverDetectorScreen  extends StatelessWidget {
   DriverDetectorScreen ({super.key});

  TextEditingController platNumber =TextEditingController();
  TextEditingController driverName =TextEditingController();
  TextEditingController driverCode =TextEditingController();
  TextEditingController driverRate =TextEditingController();
  TextEditingController driverData =TextEditingController();

  TextEditingController driverText =TextEditingController();
   DateTime now = DateTime.now();


  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,AppStates>(

      listener: (context, state) {

      },
      builder: (context, state) {
        AppCubit cubit= AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading:const Image(image: AssetImage("asset/image/bus_log_app.png"),width: 20),

            title:const Center(
              child: Text("CTA bus service",
                style: TextStyle(
                ),),
            ),
            actions:   [
              IconButton(onPressed: () {
                showDialog(context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("يوم سعيد "),
                    content: const Text("للخروج من الصفحة "),
                    actions: [
                      Row(
                        children: [
                          Column(
                            children: [
                              IconButton(onPressed: () {
                                navigateStop(context,  HomeScreen());
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
              },
                  icon: const Icon(Icons.arrow_forward_ios,color: Colors.white,)),

            ],

          ),
          body:Form(
            key: formKey,
            child: SingleChildScrollView(

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(


                  children: [

                    Container(
                      height: 80,

                      width: double.infinity,
                      color: Colors.grey,
                      padding: const EdgeInsets.all(10),

                      child:  const Row(
                        children: [
                          Image(
                              image: AssetImage("asset/image/bus-driver.png"),width: 40),
                          Spacer(),
                          Text("ازيك يا استاذ حسن "),

                        ],
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          const Text("لوحة سيارة",style:
                          TextStyle(fontSize:20 , fontWeight: FontWeight.bold),),
                          SizedBox(
                            width: 250,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color:cubit.isDark ? borderInputDark:borderInputLight),
                                child: TextFormField(
                                  controller: platNumber,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(


                                    prefixIcon: Icon(MyFlutterApp.license_plate,color:Color(0xFF2B475E) ),
                                    border:InputBorder.none ,
                                  ),

                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          const Text("تاريخ",style:
                          TextStyle(fontSize:20 , fontWeight: FontWeight.bold),),
                          SizedBox(
                            width: 250,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color:cubit.isDark ? borderInputDark:borderInputLight),
                                child: TextFormField(
                                  controller: driverData,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(


                                    prefixIcon: Icon(Icons.calendar_month_outlined,color:Color(0xFF2B475E) ),
                                    border:InputBorder.none ,
                                  ),

                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),




                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: TextField(


                        maxLines: 10,

                        decoration: InputDecoration(
                          hintText: "ملاحظات وتقيم",

                          border: OutlineInputBorder(),

                        ),
                      ),
                    ),
                    MaterialButton(onPressed: () {

                    },
                      color: buttomIconLight,
                      height: 25,
                      child: const Text("ارسال",
                         ) ,
                    ),












                  ],
                ),
              ),
            ),
          ),
        );

      },

    );
  }
}
