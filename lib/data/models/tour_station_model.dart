class TourStation {
 late String city;
 late String busNumber;
 late List<String> stations;
 late int price;
TourStation.fromJson(Map<String,dynamic>json){
  city = json['City'];
  busNumber = json['Bus Number'];
  stations = json['Stations'];
  price = json['Price'];


}
