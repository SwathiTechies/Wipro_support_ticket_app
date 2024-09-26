import 'package:get/get.dart';
import 'package:wipro_ticket/model/location_model.dart';
import 'package:wipro_ticket/model/sub_location_model.dart';
import '../services/location_api.dart';

class LocationController extends GetxController {
  final LocationApiService apiService = LocationApiService();

  //var locations = [].obs; // Observable list to hold locations
  Rx<LocationModel> locationModel = LocationModel().obs;
  Rx<SubLocationModel> subLocationModel = SubLocationModel().obs;
  var isLoading = false.obs;

  void fetchLocations() async {
    try {
      isLoading(true);
      var locationData = await apiService.getLocation();
      print(locationData);
      locationModel.value = locationModelFromJson(locationData.body); // Assign the API response to the list
    } catch (e) {
      print("Error fetching locations: $e");
    } finally {
      isLoading(false);
    }
  }


  void postSubLocation(int id) async {
    try {
      isLoading(true);
      var subLocationData = await apiService.subLocationPost(id);
      subLocationModel.value = subLocationModelFromJson(subLocationData.body); // Correct parsing
    } catch (e) {
      print("Error posting sub-location: $e");
    } finally {
      isLoading(false);
    }
  }

}
