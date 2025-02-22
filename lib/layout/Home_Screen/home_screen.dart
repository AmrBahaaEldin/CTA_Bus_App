import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:grade_project/shared/components/components.dart';
import 'package:grade_project/shared/cubit/cubit.dart';
import 'package:grade_project/shared/cubit/state.dart';
import 'package:grade_project/shared/styles/log_app.dart';




import '../../Views/Login_Screen/login_screen.dart';
import '../../shared/styles/Nav_item.dart';




class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
IconApp iconApp=IconApp();
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,AppStates>(listener:(context, state) {},
      builder: (context, state) {
        AppCubit cubit= AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading:IconButton(icon:  Image(image: iconApp.homeIconImage(),width:40),
              onPressed: () {
              navigateTo(context, const LoginScreen());
            },
            ),
            title:const Center(
              child: Text("CTA bus service",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),),
            ),

            actions:  const [

            ],
          ),
          body:cubit.homeScreen[cubit.currentHomeIndex],



          bottomNavigationBar:cubit.isDark?const DrakNag(): const BrightNag()






        );
      },



    );
  }


}
