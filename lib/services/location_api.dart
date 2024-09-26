import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wipro_ticket/constant/api_url.dart';

class LocationApiService {

   getLocation() async {
     try{
       final response = await http.get(Uri.parse(ApiUrls.getLocation));

       if (response.statusCode == 200) {
         //List jsonResponse = jsonDecode(response.body);
         return response;
         //jsonResponse.map((post) => LocationModel.fromJson(post)).toList();
       } else {
         throw Exception('Failed to load posts');
       }
     }
    catch(e){
       return e.toString();
    }
  }

   subLocationPost(int locationId) async {
    final response = await http.post(
      Uri.parse(ApiUrls.getSubLocation),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({
        'locationId': locationId,
      }),
    );
    if (response.statusCode == 200) {
      print(response);
      return response;
    } else {
      throw Exception('Failed to create post');
    }
  }
}
