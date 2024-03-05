









import 'package:flutter/material.dart';
import 'package:grade_project/shared/styles/log_app.dart';

import '../../screen/admin/admin_screen.dart';
import '../../screen/admin/list_admin.dart';

class AdminView extends StatelessWidget {

  IconApp iconApp=IconApp();

   AdminView({super.key});



  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
              leading:Image(image:iconApp.adminIconImage()),

               title: const Center(child: Text("CTA bus service",),
              ),
               actions:  const [

               ],
            ) ,
     body:AdminScreen(),





    );








  }
}
