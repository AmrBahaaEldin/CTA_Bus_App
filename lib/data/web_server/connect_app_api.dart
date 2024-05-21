



import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class WebServices {
  final dio = Dio();

  Future<List<Map<String, dynamic>>> getDataTable() async {
    //get
    //post insert & del & edit
    try {
      final response = await dio.request(

        'http://192.168.1.5:8000/guide/',
        options: Options(
          method: 'GET',
          // 10 seconds timeout
        ),
      );

      return List<Map<String, dynamic>>.from(response.data);
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<Map<String, dynamic>> getLogin(
      {required String username, required String password}) async {
    try {
      Response response = await dio.get(
        'http://192.168.1.5:8000/employees/login/',

        queryParameters: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return response.data; // تأكد من البيانات التي تتوقعها
      } else {
        throw Exception("فشل في تسجيل الدخول: ${response.statusCode}");
      }
    } catch (e) {
      print("خطأ أثناء إرسال الطلب: $e");
      throw Exception("فشل في تسجيل الدخول");
    }
  }





  ////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////
  ///////////////////////////////////
  /////////////////////////
  //////////////////////////
  /////////////////////
  ////////
  ////////////////////////////////////////
  ///////////////////////
  ///////////////
  ////////////////////////////////////////////////
  //////////////////
  ///////////////
  //////////
  /////////////

  Future<Map<String, dynamic>> postLogin({
    required String employeeID,
    required String plateNumber,
    required DateTime dataRide,
    required bool isNumberTicket,
    required bool isDriverCommitted,
    required bool isBusCrowded,
    required bool isDriverWell,
    String? description,
  }) async {
    final dateString = DateFormat('yyyy-MM-dd').format(dataRide);

    final dataReport = {
      "employee_id": employeeID,
      "plate_number_bus": plateNumber,
      "date_ride": dateString,
      "number_of_tickets_equal_number_of_passenger": isNumberTicket,
      "driver_committed_to_route": isDriverCommitted,
      "bus_crowded": isBusCrowded,
      "driver_treated_well": isDriverWell,
      "description": description,
    };

    try {
    Response response = await Dio().post(
        'http://192.168.1.5:8000/reporting/',
        data: dataReport,
      );

      print("البيانات المرسلة: $dataReport");

      return response.data; // الاستجابة بنجاح

    } on DioException catch (e) {

      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          print('Error: Bad request. ${e.response!.data}');
          return e.response!.data;

        } else {
          print('Error: ${e.response!.statusCode} - ${e.response!.statusMessage}');
        }
      } else {
        // لم يتم استلام استجابة من الخادم
        print('Error: No response from server. Check your network connection.');
      }
      throw Exception("Request failed with status code ${e.response?.statusCode}");
    }
  }
  }







///////////////////////////////////////////////

























