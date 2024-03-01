import 'package:flutter/material.dart';

class ListTableScreen extends StatelessWidget {
   ListTableScreen({super.key});
  final List<Map<String, dynamic>> data = [
    {'city': 'القاهرة', 'numberBus': 25, 'Stations': 'ميدان الجيزة و الدقي و وسط البلد  و فصيل','prices':7.5},
    {'city': 'القاهرة', 'numberBus': 400, 'Stations': 'ميدان الجيزة و الدقي و خامس و ميدان الساعة و فصيل','prices':6.5},
    {'city': 'الجيزة', 'numberBus': 600, 'Stations': 'اكتوبر و الدقي و التجمع الاول و ميدان الساعة و فصيل ','prices':5},
    {'city': 'الجيزة', 'numberBus': 897, 'Stations': 'اكتوبر و الدقي و التجمع الاول و ميدان الساعة و فصيل ','prices':5},
    {'city': 'الجيزة', 'numberBus': 234, 'Stations': 'اكتوبر و الدقي و التجمع الاول و ميدان الساعة و فصيل ','prices':5},
    {'city': 'الجيزة', 'numberBus': 149, 'Stations': 'اكتوبر و الدقي و التجمع الاول و ميدان الساعة و فصيل ','prices':10},
    {'city': 'الجيزة', 'numberBus': 200, 'Stations': 'اكتوبر و الدقي و التجمع الاول و ميدان الساعة و فصيل ','prices':3},
    {'city': 'الجيزة', 'numberBus': 400, 'Stations': 'اكتوبر و الدقي و التجمع الاول و ميدان الساعة و فصيل ','prices':4},
  ];
  @override
  Widget build(BuildContext context) {
    return DataTable(




        columns: const [
          DataColumn(label:Text("المدينة")),
          DataColumn(label: Text("رقم اتوبيس")),
          DataColumn(label: Text("المناطق")),
          DataColumn(label: Text("السعر"))

        ],
        rows:List<DataRow>.generate(
            data.length,
                (index) => DataRow( color: const MaterialStatePropertyAll(Colors.blue),

                cells: [
                  DataCell(Text(data[index]['city'].toString())),
                  DataCell(Text(data[index]['numberBus'].toString(),)),
                  DataCell(Text(data[index]['Stations'].toString())),
                  DataCell(Text(data[index]['prices'].toString())),

                ])
        )

    );
  }
}
