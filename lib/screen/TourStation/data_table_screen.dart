import 'package:flutter/cupertino.dart';

class DataTableScreen extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  final String searchText;
  final String selectedSearchType;
  final List<Map<String, dynamic>> filteredData;

  const DataTableScreen({
    Key? key,
    required this.data,
    required this.searchText,
    required this.selectedSearchType,
    required this.filteredData,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {


    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width,
        ),
        child: DataTable(
          columns: const [
            DataColumn(label: Text("المدينة", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 15))),
            DataColumn(label: Text("رقم الاتوبيس", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 15))),
            DataColumn(label: Text("المناطق", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 15))),
            DataColumn(label: Text("السعر", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 15))),
          ],
          rows: List<DataRow>.generate(
            filteredData.length,
                (index) => DataRow(
              color: const MaterialStatePropertyAll(Colors.grey),
              cells: [
                DataCell(Text(filteredData[index]['city'].toString())),
                DataCell(Text(filteredData[index]['numberBus'].toString())),
                DataCell(Text(filteredData[index]['Stations'].toString())),
                DataCell(Text(filteredData[index]['prices'].toString())),
              ],
            ),
          ),
        ),
      ),
    );
  }
}