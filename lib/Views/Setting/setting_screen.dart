
import 'package:flutter/material.dart';
import 'package:grade_project/shared/cubit/cubit.dart';

import '../../models/setting_data.dart';
class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
   String? selectedLanguage='ar';
    return    Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage("asset/image/Bus Stop-pana.png")),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  const Text("Theme"),
                  const Spacer(),
                 Switch(value: AppCubit.get(context).isDark,
                     onChanged: (value) {
                   setState(() {

                     AppCubit.get(context).changeTheme();
                   });

                     },)
                 /* TextButton(onPressed: () {

                      AppCubit.get(context).changeTheme();
                  },
                      child:const Icon(Icons.brightness_4_outlined) ),*/
                ],
              ),

            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  const Text("language"),
                  const Spacer(),
                  DropdownButton(
                    hint: const Text('language'),
                    value: selectedLanguage,
                    onChanged: (value) {

                      setState(() {

                        selectedLanguage=value ;

                      });

                    },

                    items: language.map((lang) {
                      return  DropdownMenuItem(

                        value: lang,
                        child: Text(lang),
                      );
                    }).toList(),

                  ),
                ],
              ),

            ),
            const SizedBox(height: 20,),




          ]),
    );

  }
}
