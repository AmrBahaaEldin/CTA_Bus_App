

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/shared/components/components.dart';
import 'package:grade_project/shared/cubit/cubit.dart';
import 'package:grade_project/shared/cubit/state.dart';
import '../Driver detector/driverDetector_screen.dart';
import '../Scan/scan_screen.dart';



// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  TextEditingController emailController =TextEditingController();

  TextEditingController passwordController =TextEditingController();
  var formKey=GlobalKey<FormState>();
  LoginScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(listener: (context, state) {},
      builder: (context, state) {
        return (Scaffold(
          appBar: AppBar(
            leading:const Image(image: AssetImage("asset/image/bus_log_app.png"),width: 20),

            title:const Center(
              child: Text("CTA bus service",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),),
            ),
            actions:   [
              IconButton(onPressed: () => navigateBack(context),
                  icon: const Icon(Icons.arrow_forward_ios,color: Colors.white,)),

            ],

          ),
          body:SingleChildScrollView(
            child: Column(children: [
              const Image(image: AssetImage("asset/image/bus_login.png"),height: 200,width: 200,),
              const SizedBox(height: 10),
              const Column(
                  children: [
                    Text('مرحبا ,',style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),),
                    Text('حافظ على حياتك وحياة الآخرين',style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),),
                  ]
              ),
              Form(
                key:formKey ,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text( "تسجيل الدخول ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),
                      const SizedBox(height: 10,),
                      //Email_driver
                      fieldButton(
                          type: TextInputType.emailAddress,
                          controller:emailController ,
                          valid: (value) {
                            if(value!.isEmpty)
                            {
                              return "please enter email try again";
                            }return null;
                          },
                          prefix: const Icon(Icons.email_outlined),
                          label: "حساب "),
                      const SizedBox(height: 10,),
                      //password_Driver
                      fieldButton(
                          type: TextInputType.visiblePassword,
                          controller: passwordController,
                          valid: (value) {
                            if(value!.isEmpty) {
                              return "please enter password again ";
                            }return null;
                          },
                          isPassword: AppCubit.get(context).isPassword,
                          prefix: const Icon(Icons.lock_outline),
                          suffix: Icon(AppCubit.get(context).suffixIconPassword),
                          suffixPressed: () {
                            AppCubit.get(context).changePasswordVisibility();
                          },
                          label: "كلمة السر"),
                      const SizedBox(height: 20,),
                      defaultButton(
                        text: 'دخول',
                        pressed:() {

                        if (formKey.currentState!.validate()){
                          emailController.text=="Amr" && passwordController.text=="1234" ?navigateStop(context, DriverDetectorScreen()):navigateStop(context, const ScanScreen());
                          emailController.text;
                          passwordController.text;



                          }

                        },),

                    ],
                  ),

                ),
              ),


                ],),
          ),

        ));
      }, );
  }
}
