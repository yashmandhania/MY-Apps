import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location; // location name for UI
  String? time; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool? isDaytime; // true or false if daytime or not

  WorldTime({ required this.location, required this.flag, required this.url });

  Future <void> getTime() async {
    try{
      //make a request
      var abc = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      http.Response response = await http.get(abc);
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      //print(datetime);
      //print(offset);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      //print(now);

      //set time property
      isDaytime = now.hour > 6 && now.hour < 19 ? true : false;
      time= DateFormat.jm().format(now);
    }
    catch(e){
      print('caught error : $e');
      time='could not get time';
    }


  }

}
