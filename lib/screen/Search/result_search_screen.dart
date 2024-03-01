
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../Map/mapTest.dart';

class ResultSearchScreen {
  void showSearchSheet(BuildContext context, List<Map<String, dynamic>> data) {
    showBottomSheet(context: context,
      builder: (context) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: DataTable(
                  columns:  const [

                    DataColumn(label: Text("رقم الاتوبيس")),
                    DataColumn(label: Text("المدة")),
                    DataColumn(label: Text("العرض")),

                  ],
                  rows:List<DataRow>.generate(

                      data.length,
                          (index) => DataRow( color: const MaterialStatePropertyAll(Colors.blue),

                          cells: [

                            DataCell(Text(data[index]['numberBus'].toString(),)),
                            DataCell(
                                Text(data[index]['duration'].toString())),
                            DataCell(
                              Text(data[index]['show'].toString()),

                              onTap: () {
                                navigateTo(context, const MapScreen());
                              },
                            ),

                          ])
                  )

              ),
            ),
            SliverToBoxAdapter(
                child: defaultButton(text: "اغلاق", pressed: () {
                  navigateBack(context);
                },)


            ),


          ],
        );
      },);
  }
}