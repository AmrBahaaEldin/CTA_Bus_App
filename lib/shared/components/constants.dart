import 'package:flutter/cupertino.dart';
//Header////
TableRow tableRowHeader =const TableRow(
children: <Widget>[

Padding(
padding: EdgeInsets.all(8.0),
child: Text("رقم اتوبيس",textScaleFactor: 1.5),
),
Padding(
padding: EdgeInsets.all(8.0),
child: Text("المدينة",textScaleFactor: 1.5),
),
Padding(
padding: EdgeInsets.all(8.0),
child: Text("المناطق",textScaleFactor: 1.5),
),
Padding(
padding: EdgeInsets.all(8.0),
child: Text("السعر",textScaleFactor: 1.5),
),


]
);
TableRow tableRowBody=const TableRow(
    children: <Widget>[

      Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("115"),
      ),
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("القاهرة"),
      ),

      Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("ميدان الجيزة و الدقي و فيصل وميدان الساعة وفصيل",maxLines: 20,),
      ),
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("7ج"),
      ),

    ]
);
