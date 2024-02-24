
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hexcolor/hexcolor.dart';

import '../cubit/cubit.dart';
import 'custom_icon.dart';

class BrightNag extends StatelessWidget {
  const BrightNag({super.key});

  @override
  Widget build(BuildContext context) {
    return GNav(
      backgroundColor:const Color(0xffF6F6F6),
      iconSize: 25,
      activeColor: const Color(0xff315D9D),
      color: const Color(0xffA6A6A6),
      tabBackgroundColor: Colors.grey,
      padding: const EdgeInsets.all(16),
      selectedIndex:AppCubit.get(context).currentHomeIndex,
      gap: 8,
      onTabChange: (index) {
        AppCubit.get(context).toggleHomePage(index);
      },

      tabs: const [

        GButton(
          icon: MyFlutterApp.google_maps,
          gap: 8,
          text: "خريطة",


        ),
        GButton(
          icon:Icons.search,
          gap: 8,
          text: "بحث",


        ),
        GButton(
          icon:Icons.book_outlined,
          gap: 8,
          text: "دليل",


        ),
        GButton(
          icon:Icons.settings,
          gap: 8,
          text: "اعدادات ",


        ),


      ],
    );
  }
}
class DrakNag extends StatelessWidget {
  const DrakNag({super.key});

  @override
  Widget build(BuildContext context) {
    return  GNav(
      backgroundColor:const Color(0xff2F2F2D),
      activeColor: const Color(0xff1B5DAA),
      iconSize: 25,
      color: const Color(0xff979797),
      tabBackgroundColor: Colors.grey,
      padding: const EdgeInsets.all(16),
      selectedIndex:AppCubit.get(context).currentHomeIndex,
      gap: 8,
      onTabChange: (index) {
        AppCubit.get(context).toggleHomePage(index);
      },

      tabs: const [

        GButton(
          icon: MyFlutterApp.google_maps,
          gap: 8,
          text: "خريطة",


        ),
        GButton(
          icon:Icons.search,
          gap: 8,
          text: "بحث",


        ),
        GButton(
          icon:Icons.book_outlined,
          gap: 8,
          text: "دليل",


        ),
        GButton(
          icon:Icons.settings,
          gap: 8,
          text: "اعدادات ",


        ),


      ],
    );
  }
}




