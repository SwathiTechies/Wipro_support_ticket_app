import 'dart:convert';
import 'dart:ui';

import 'package:http/http.dart'as http;

import '../constant/api_url.dart';

class TicketApiServices {

  ticketRegisterPostApi(int locationId, int subLocationId, String otherLocation, int categoryId, int subCategoryId, String description, List<Image> images  ) async {
    final response = await http.post(
      Uri.parse(ApiUrls.ticketRegistration),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({
        'locationId': locationId,
        'subLocationId': subLocationId,
        'otherLocation': otherLocation,
        'categoryId': categoryId,
        'subCategoryId': subCategoryId,
        'description': description,
        'image': images,
      }),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return response;
    } else {
      throw Exception('Failed to create Ticket');
    }
  }

}