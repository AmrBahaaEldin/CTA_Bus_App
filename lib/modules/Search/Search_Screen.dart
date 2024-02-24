




import 'package:flutter/material.dart';

import '../../shared/components/components.dart';


// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});
  var positionTo = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Image(image: AssetImage("asset/image/Address-rafiki.png")),
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
                              label: "محطة",
                              prefix:const Icon(Icons.bus_alert_outlined),
                              type: TextInputType.text,
                              controller: positionTo,
                              valid: (value) {
                                if (value!.isEmpty) {
                                  return "empty  please Enter Region  ";
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
