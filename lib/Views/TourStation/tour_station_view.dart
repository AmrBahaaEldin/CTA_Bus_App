
import 'package:flutter/material.dart';
import 'package:grade_project/screen/TourStation/list_table_screen.dart';
import 'package:grade_project/screen/TourStation/tour_station_screen.dart';






class TourStationView extends StatelessWidget {


  const TourStationView({super.key});



  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child:  TourStationScreen()
        ),


        SliverToBoxAdapter(
          child:ListTableScreen(),
        )
      ],
    );






  }
}
