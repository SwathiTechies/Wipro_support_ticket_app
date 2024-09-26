import 'package:flutter/material.dart';
import 'package:wipro_ticket/views/dashboard_screen.dart';
import '../../Controller/category_controller.dart';
import '../../Controller/location_controller.dart';
import '../../model/category_model.dart' as cm;
import '../../model/sub_category_model.dart' as scm;
import '../../model/sub_location_model.dart' as slm;
import '../../model/location_model.dart'as lm;
import '../../widgets/app_button.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? _initialLocationDrpValue;
  String? _initialSubLocationDrpValue;
  String? _initialCategoryDrpValue;
  String? _initialSubCategoryDrpValue;
  final _formKey = GlobalKey<FormState>();

  LocationController myController = LocationController();
  CategoryController categoryController = CategoryController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myController.fetchLocations();
    categoryController.fetchCategory();
  }


  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var screenWidth = mediaQuery.size.width;
    var screenHeight = mediaQuery.size.height;

    // String? emailValidator(String value) {
    //   if (value.isEmpty) {
    //     return 'Please enter your email';
    //   } else {
    //     return null;
    //   }
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text('REGISTER USER', style: TextStyle(fontSize: screenHeight*0.03, fontWeight: FontWeight.bold),),
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: screenHeight*0.02,horizontal: screenWidth*0.04),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'USER NAME',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenHeight*0.018),
                  ),
                  SizedBox(
                    height: screenHeight*0.01,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter First Name';  // Error message
                      }
                      return null;  // No error
                    },
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.only(top: screenHeight*0.01, bottom: screenHeight*0.01, left: screenWidth*0.02),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenHeight*0.02),
                      ),
                      filled: true,
                      fillColor: Color(0xff9B5B5),
                      hintText: 'First Name',
                      hintStyle: TextStyle(color: Colors.grey,fontSize: screenHeight*0.017),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight*0.02,
                  ),
                  // Text(TE
                  //   'LAST NAME',
                  //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenHeight*0.018),
                  // ),
                  // SizedBox(
                  //   height: screenHeight*0.01,
                  // ),
                  // TextFormField(
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Please Enter Last Name';  // Error message
                  //     }
                  //     return null;  // No error
                  //   },
                  //   decoration: InputDecoration(
                  //     contentPadding:
                  //     EdgeInsets.only(top: screenHeight*0.01, bottom: screenHeight*0.01, left: screenWidth*0.02),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(screenHeight*0.02),
                  //     ),
                  //     filled: true,
                  //     fillColor: Color(0xff9B5B5),
                  //     hintText: 'First Name',
                  //     hintStyle: TextStyle(color: Colors.grey,fontSize: screenHeight*0.017),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: screenHeight*0.02,
                  // ),
                  Text(
                    'CONTACT NUMBER',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenHeight*0.018),
                  ),
                  SizedBox(
                    height: screenHeight*0.01,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Contact Number';  // Error message
                      }
                      return null;  // No error
                    },
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.only(top: screenHeight*0.01, bottom: screenHeight*0.01, left: screenWidth*0.02),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenHeight*0.02),
                      ),
                      filled: true,
                      fillColor: Color(0xff9B5B5),
                      hintText: 'Contact Number',
                      hintStyle: TextStyle(color: Colors.grey,fontSize: screenHeight*0.017),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight*0.02,
                  ),
                  Text(
                    'EMAIL ID',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenHeight*0.018),
                  ),
                  SizedBox(
                    height: screenHeight*0.01,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Email Id';  // Error message
                      }
                      return null;  // No error
                    },
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.only(top: screenHeight*0.01, bottom: screenHeight*0.01, left: screenWidth*0.02),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenHeight*0.02),
                      ),
                      filled: true,
                      fillColor: Color(0xff9B5B5),
                      hintText: 'Email Id',
                      hintStyle: TextStyle(color: Colors.grey,fontSize: screenHeight*0.017),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight*0.02,
                  ),
                  Text(
                    'LOCATION',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenHeight * 0.018),
                  ),
                  SizedBox(
                    height: screenHeight*0.01,
                  ),
                  DropdownButtonFormField<String>(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select location'; // Error message
                      }
                      return null; // No error
                    },
                    decoration: InputDecoration(
                      labelText: 'Select Location',
                      labelStyle: TextStyle(
                          color: Colors.grey, fontSize: screenHeight * 0.016),
                      filled: true,
                      fillColor: Color(0xff9B5B5),
                      border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(screenHeight * 0.03),
                      ),
                    ),
                    value: _initialLocationDrpValue,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: myController.locationModel.value.data
                        ?.map<DropdownMenuItem<String>>((lm.Datum locations) {
                      return DropdownMenuItem(
                        value: locations.locationId.toString(),
                        child: Text(locations.locationName!),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _initialLocationDrpValue = newValue!;
                        // Reset sub-location dropdown value to null
                        _initialSubLocationDrpValue = null;

                        // Fetch sub-locations based on selected location
                        final location = myController.locationModel.value.data?.firstWhere(
                              (lm.Datum location) => location.locationId.toString() == _initialLocationDrpValue,
                          orElse: () => lm.Datum(locationId: -1, locationName: ''),
                        );

                        // Call the sub-location API using the location ID
                        myController.postSubLocation(location!.locationId!);
                      });
                    },
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Text(
                    'SUB LOCATION',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenHeight * 0.018),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField<String>(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select sub location'; // Error message
                        }
                        return null; // No error
                      },
                      decoration: InputDecoration(
                        labelText: 'Select Sub-Location',
                        labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: screenHeight * 0.016),
                        filled: true,
                        fillColor: Color(0xff9B5B5),
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(screenHeight * 0.03)),
                      ),
                      value: _initialSubLocationDrpValue,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: myController.subLocationModel.value.data?.map<DropdownMenuItem<String>>((slm.Datum subLocation) {
                        // Use a unique value, such as sublocationid, to avoid duplicates.
                        return DropdownMenuItem(
                          value: subLocation.sublocationid.toString(),// Use a combination of ID and name
                          child: Text(subLocation.sublocationname!),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _initialSubLocationDrpValue = newValue!;
                        });
                      }),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Text(
                    'CATEGORY',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenHeight * 0.018),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  DropdownButtonFormField<String>(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select category'; // Error message
                      }
                      return null; // No error
                    },
                    decoration: InputDecoration(
                      labelText: 'Select Category',
                      labelStyle: TextStyle(
                          color: Colors.grey, fontSize: screenHeight * 0.016),
                      filled: true,
                      fillColor: Color(0xff9B5B5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenHeight * 0.03),
                      ),
                    ),
                    value: _initialCategoryDrpValue,
                    icon: Icon(Icons.keyboard_arrow_down),

                    // Populate the category dropdown with category data
                    items: categoryController.categoryModel.value.data
                        ?.map<DropdownMenuItem<String>>((cm.Datum category) {
                      return DropdownMenuItem(
                        value: category.categoryId.toString(),
                        child: Text(category.categoryName!, style: TextStyle(fontSize: screenHeight*0.02),),
                      );
                    }).toList(),

                    onChanged: (String? newValue) {
                      setState(() {
                        setState(() {
                          _initialCategoryDrpValue = newValue!;

                          _initialSubCategoryDrpValue = null;

                          // Check if selected category has any sub-categories
                          final selectedCategory = categoryController.categoryModel.value.data?.firstWhere(
                                (cm.Datum category) => category.categoryId.toString() == _initialCategoryDrpValue,
                            orElse: () => cm.Datum(categoryId: -1, categoryName: ''),
                          );

                          categoryController.postSubCategory(selectedCategory!.categoryId!);
                        });
                      });
                    },
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Text(
                    'SUB-CATEGORY',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenHeight * 0.018),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  DropdownButtonFormField<String>(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select sub category'; // Error message
                      }
                      return null; // No error
                    },
                    decoration: InputDecoration(
                      labelText: 'Select Sub-Category',
                      labelStyle: TextStyle(
                          color: Colors.grey, fontSize: screenHeight * 0.016),
                      filled: true,
                      fillColor: Color(0xff9B5B5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenHeight * 0.03),
                      ),
                    ),
                    value: _initialSubCategoryDrpValue,
                    icon: Icon(Icons.keyboard_arrow_down),

                    // Populate the sub-category dropdown with the fetched sub-category data
                    items: categoryController.subCategoryModel.value.data
                        ?.map<DropdownMenuItem<String>>((scm.Datum subCategory) {
                      return DropdownMenuItem(
                        value: subCategory.subCategoryId.toString(),
                        child: Text(subCategory.subCategoryName!,softWrap: false,overflow: TextOverflow.ellipsis ,style: TextStyle(fontSize: screenHeight*0.015),),
                      );
                    }).toList(),

                    onChanged: (String? newValue) {
                      setState(() {
                        _initialSubCategoryDrpValue = newValue!;
                      });
                    },
                  ),
                  SizedBox(height: screenHeight*0.02),
                  Center(
                    child: AppButton(
                        btnText: 'REGISTER',
                        widthSize: screenHeight * 0.3,
                        useAlternativeColor: false,
                        onTap: () {
                          if(_formKey.currentState!.validate()){
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => ApprovedScreen()));
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DashboardScreen()));
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
