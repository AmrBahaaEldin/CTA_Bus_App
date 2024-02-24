
import 'package:flutter/material.dart';
import 'package:grade_project/shared/components/components.dart';

import '../../shared/components/constants.dart';



// ignore: must_be_immutable
class GuidanceScreen extends StatelessWidget {
  GuidanceScreen({super.key});
 var textController=TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.max,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Image(image: AssetImage("asset/image/bus_location1.png"),height: 400,width: 500),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("دليل المحطات",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
          ),
          Form(key: formKey,
            child: Padding(
              padding:  const EdgeInsets.all(40.0),
              child: fieldButton(label:"البحث" ,prefix:const Icon(Icons.search) ,type: TextInputType.text, controller: textController, valid: (value) {
                if(value!.isEmpty){
                  return "empty please Enter Number";
                }
                if(formKey.currentState!.validate()){
                  textController.text;
                }
                return null;


              },),
            ),
          ),
          defaultButton(text: "تفاصيل",width: 200,isUppercase: true, pressed:() {
            if(formKey.currentState!.validate()){
              textController.text;
            }
          }),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              border: TableBorder.all(),
              defaultColumnWidth: const FixedColumnWidth(90),


              children:   [

                tableRowHeader,
                tableRowBody,
                tableRowBody,
                tableRowBody,
                tableRowBody,
                tableRowBody,






              ],
            ),
          ),




        ],
      ),
    );



      
    
  }
}
