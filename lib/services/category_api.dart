import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wipro_ticket/constant/api_url.dart';

class CategoryApiServices {

  getCategory() async {
    try{
      final response = await http.get(Uri.parse(ApiUrls.getCategory));

      if (response.statusCode == 200) {
        //List jsonResponse = jsonDecode(response.body);
        print(response.body);
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

  subCategoryPost(int subCategoryId) async {
    final response = await http.post(
      Uri.parse(ApiUrls.getSubCategory),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({
        'categoryId': subCategoryId,
      }),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return response;
    } else {
      throw Exception('Failed to create post');
    }
  }
}