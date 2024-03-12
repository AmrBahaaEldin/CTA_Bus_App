import 'package:flutter/material.dart';
import 'package:grade_project/shared/components/components.dart';
import 'package:grade_project/shared/styles/log_app.dart';

import 'data_table_screen.dart';

class TourStationScreen extends StatefulWidget {
  const TourStationScreen({Key? key}) : super(key: key);

  @override
  State<TourStationScreen> createState() => _TourStationScreenState();
}

class _TourStationScreenState extends State<TourStationScreen> {
  final List<Map<String, dynamic>> data = [
    {'city': 'الجيزة', 'numberBus': 255, 'Stations': ['فصيل', 'مهندسين ', 'الدقي', 'الجيزة'], 'prices': 5},
    {'city': 'القاهرة', 'numberBus': 21, 'Stations': ['فصيل', 'وسط البلد', 'الدقي', 'عين شمس'], 'prices': 7},
    {'city': 'القاهرة', 'numberBus': 20, 'Stations': ['فصيل', 'صقر', 'صلاح سالم', 'طالبية'], 'prices': 9.5},
    {'city': 'القاهرة', 'numberBus': 40, 'Stations': ['فصيل', 'زاوية', 'اوبرا', 'المنيب'], 'prices': 10.5},
    {'city': 'القاهرة', 'numberBus': 894, 'Stations': ['6اكتوبر', 'وسط البلد', 'الدقي', 'عتبة'], 'prices': 4.5},
  ];

  List<Map<String, dynamic>> filteredData = [];
  TextEditingController searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String searchText = "";
  var selectedSearchType = "المدينة";
LogApp logApp=LogApp();
  @override
  void initState() {
    super.initState();
    filteredData = data;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image(
              image: logApp.tourStationImage(),
              height: 400,
              width: 500,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "دليل المحطات",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  TextFormField(


                    controller: searchController,
                    decoration:InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
                    ),
                      labelText: selectedSearchType,
                      prefix:const Icon( Icons.search,color: Colors.blue),
                      suffix:DropdownButton(
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        dropdownColor: Colors.grey.shade400,
                        style: const TextStyle(color: Colors.blue, fontSize: 14),
                        icon: const Icon(
                          Icons.arrow_downward,
                          color: Colors.blue,
                        ),
                        value: selectedSearchType,
                        items: <String>["المدينة", "رقم الاتوبيس", "المناطق", "السعر"].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (changeValue) {
                          setState(() {
                            selectedSearchType = changeValue!;
                          });
                        },
                      ),
                    ),
                        
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "الرجاء إدخال البيانات بشكل صحيح";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        searchText = value;
                      });
                    },
                  ),


                ],
              ),
            ),
          ),

        defaultButton(
          height: 50,
          width: 100,
          text: "البحث",
          pressed: () {
          if (formKey.currentState!.validate()) {
            // Filter the data based on the selected search type and search text
            filteredData = data.where((entry) {
              switch (selectedSearchType) {
                case 'المدينة':
                  return entry['city'].contains(searchText);
                case 'رقم الاتوبيس':
                  return entry['numberBus'].toString().contains(searchText);
                case 'المناطق':
                  return entry['Stations'].toString().contains(searchText);
                case 'السعر':
                  return entry['prices'].toString().contains(searchText);
                default:
                  return false;
              }
            }).toList();

            // Update the DataTableScreen with the filtered data
            setState(() {});
          }
        },),
          DataTableScreen(filteredData: filteredData),
        ],
      ),
    );
  }
}

