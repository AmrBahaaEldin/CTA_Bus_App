






import 'package:flutter/material.dart';

import 'package:grade_project/Views/Search/result_search_screen.dart';
import 'package:grade_project/shared/styles/log_app.dart';
import '../../shared/components/components.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});
   LogApp logApp=LogApp();
   ResultSearchScreen resultSearchScreen =ResultSearchScreen();
  var positionTo = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> data = [
      {'numberBus': 100, 'duration': "25",'show':"اضغط هنا"},
      {'numberBus': 300, 'duration': '20','show':"اضغط هنا"},
      {'numberBus': 900, 'duration': '30','show':"اضغط هنا"},
      {'numberBus': 40, 'duration': '9','show':"اضغط هنا"},

    ];
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image(image:logApp.searchImage()),
              ),
              Form(key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: 35,),
                          Expanded(
                            child: fieldButton(
                              label: "المنطقة",
                              prefix:const Icon(Icons.bus_alert_outlined),
                              type: TextInputType.text,
                              controller: positionTo,
                              valid: (value) {
                                if (value!.isEmpty) {
                                  return "خطا اتدخل المنطقة صحيح   ";

                                }
                                return null;
                              },
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: defaultButton(text: "بحث", width:100 ,pressed: () {
                  if (formKey.currentState!.validate()) {
                    resultSearchScreen.showSearchSheet(context, data);

                  }

                },

                ),
              ),




            ],
          ),
        ),

      ),
    );
  }




}
