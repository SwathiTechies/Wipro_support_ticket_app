// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../model/ticket_register_model.dart';
// import '../services/ticket_api.dart';
//
// class TicketController extends GetxController {
//   final TicketApiServices TApiServices = TicketApiServices();
//
//   Rx<TicketRegisterModel> ticketRegisterModel = TicketRegisterModel().obs;
//   var isLoading = false.obs;
//
//   Future<void> postSubCategory(
//       int locationId,
//       int subLocationId,
//       String otherLocation,
//       int categoryId,
//       int subCategoryId,
//       String description,
//       List<XFile> imageFiles, // Change to List<XFile>
//       ) async {
//     try {
//       isLoading(true);
//
//       // Convert List<XFile> to List<String> for API submission
//       List<String> base64Images = await _convertImagesToBase64(imageFiles);
//
//       var ticketRegisterData = await TApiServices.ticketRegisterPostApi(
//         locationId,
//         subLocationId,
//         otherLocation,
//         categoryId,
//         subCategoryId,
//         description,
//         base64Images, // Use the converted list of image paths
//       );
//
//       print('$ticketRegisterData');
//       ticketRegisterModel.value = ticketRegisterModelFromJson(ticketRegisterData.body);
//     } catch (e) {
//       print("Error posting sub-Category: $e");
//     } finally {
//       isLoading(false);
//     }
//   }
//
//   // Helper method to convert images to base64 strings
//   Future<List<String>> _convertImagesToBase64(List<XFile> imageFiles) async {
//     List<String> base64Images = [];
//
//     for (XFile imageFile in imageFiles) {
//       // Convert the image file to bytes
//       File file = File(imageFile.path);
//       List<int> imageBytes = await file.readAsBytes();
//       String base64String = base64Encode(imageBytes);
//       base64Images.add(base64String);
//     }
//
//     return base64Images;
//   }
//
//
//
//   Future<String> _loadAssetImageAsBase64(String path) async {
//     ByteData data = await rootBundle.load(path);
//     List<int> bytes = data.buffer.asUint8List();
//     return base64Encode(bytes);
//   }
//
// }
