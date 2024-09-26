import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wipro_ticket/Controller/category_controller.dart';
import 'package:wipro_ticket/Controller/location_controller.dart';
import 'package:wipro_ticket/views/register_ticket/ticket_created_screen.dart';

import '../../model/sub_category_model.dart'as scm;
import '../../model/location_model.dart' as lm;
import '../../model/sub_location_model.dart' as slm;
import '../../model/category_model.dart' as cm;
import '../../widgets/camera.dart';

class TicketRegisterScreen extends StatefulWidget {
  const TicketRegisterScreen({super.key});

  @override
  State<TicketRegisterScreen> createState() => _TicketRegisterScreenState();
}

class _TicketRegisterScreenState extends State<TicketRegisterScreen> {
  String? _initialLocationDrpValue;
  String? _initialSubLocationDrpValue;
  String? _initialSubLocation2DrpValue;
  String? _initialCategoryDrpValue;
  String? _initialSubCategoryDrpValue;
  String _initialPriorityDrpValue = 'Medium';
  String _initialSeverityDrpValue = 'Medium';

  final _formKey = GlobalKey<FormState>();
  String? _imageError;
  LocationController myController = LocationController();
  CategoryController categoryController = CategoryController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myController.fetchLocations();
    categoryController.fetchCategory();
  }

  List<String> severity = ["Low", "Medium", "High", "Critical"];
  List<String> priority = ["Low", "Medium", "High"];

  // var locations = [
  //   'Location 1',
  //   'Location 2',
  //   'Location 3',
  //   'Location 4',
  //   'Location 5',
  // ];

  // var subLocations = [
  //   'SubLocation 1',
  //   'SubLocation 2',
  //   'SubLocation 3',
  //   'SubLocation 4',
  //   'SubLocation 5',
  // ];

  var subLocations2 = [
    'SubLocation2 1',
    'SubLocation2 2',
    'SubLocation2 3',
    'SubLocation2 4',
    'SubLocation2 5',
  ];

  // var category = [
  //   'Category 1',
  //   'Category 2',
  //   'Category 3',
  //   'Category 4',
  //   'Category 5',
  // ];
  //
  // var subCategory = [
  //   'SubCategory 1',
  //   'SubCategory 2',
  //   'SubCategory 3',
  //   'SubCategory 4',
  //   'SubCategory 5',
  // ];

  List<File> _image = [];

  void _validateAndSubmit() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (_image == null) {
      setState(() {
        _imageError = 'Please upload an image.';
      });
    } else {
      setState(() {
        _imageError = null;
      });
    }

    if (isValid && _image != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TicketCreatedScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var screenWidth = mediaQuery.size.width;
    var screenHeight = mediaQuery.size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'TICKET REGISTRATION',
            style: TextStyle(
                fontSize: screenHeight * 0.02, fontWeight: FontWeight.bold),
          ),
        ),
        body: Obx(
          () => Padding(
            padding: EdgeInsets.all(screenHeight * 0.02),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'USER NAME',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenHeight * 0.018),
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(screenHeight * 0.01),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        filled: true,
                        fillColor: Color(0xff9B5B5),
                        hintText: 'User Name',
                        hintStyle: TextStyle(
                            color: Colors.grey, fontSize: screenHeight * 0.016),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter User Name'; // Error message
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Text(
                      'LOCATION',
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
                      'SUB LOCATION-2',
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
                          return 'Please select sub location2'; // Error message
                        }
                        return null; // No error
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xff9B5B5),
                        labelText: 'Select Sub-Location2',
                        labelStyle: TextStyle(
                            color: Colors.grey, fontSize: screenHeight * 0.016),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(screenHeight * 0.03)),
                      ),
                      value: _initialSubLocation2DrpValue,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: subLocations2.map((String subLocations2) {
                        return DropdownMenuItem(
                          value: subLocations2,
                          child: Text(subLocations2),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _initialSubLocation2DrpValue = newValue!;
                        });
                      },
                    ),
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
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Text(
                      'TICKET PRIORITY',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenHeight * 0.018),
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xff9B5B5),
                        // labelText: 'Select Priority',
                        // labelStyle: TextStyle(
                        //     color: Colors.grey, fontSize: screenHeight * 0.016),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(screenHeight * 0.03),
                        ),
                      ),
                      value: _initialSeverityDrpValue, // Set default value to "Medium"
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: severity.map((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _initialSeverityDrpValue = newValue!;
                        });
                      },
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Text(
                      'TICKET SEVERITY',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenHeight * 0.018),
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xff9B5B5),
                        // labelText: 'Select Severity',
                        // labelStyle: TextStyle(
                        //     color: Colors.grey, fontSize: screenHeight * 0.016),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(screenHeight * 0.03),
                        ),
                      ),
                      value: _initialPriorityDrpValue, // Set default value to "Medium"
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: priority.map((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(()
                        {
                            _initialPriorityDrpValue = newValue!;
                        });
                      },
                    ),
                    // SizedBox(
                    //   height: screenHeight*0.01,
                    // ),
                    // Text(
                    //   'SLA HOURS',
                    //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenHeight*0.018),
                    // ),
                    // SizedBox(
                    //   height: screenHeight*0.01,
                    // ),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //     contentPadding: EdgeInsets.all(screenHeight*0.01),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(25),
                    //     ),
                    //     filled: true,
                    //     fillColor: Color(0xff9B5B5),
                    //     hintText: 'SLA HOURS',
                    //     hintStyle: TextStyle(color: Colors.grey, fontSize: screenHeight*0.016),
                    //   ),
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Please Enter Sla Hours';  // Error message
                    //     }
                    //     return null;
                    //   },
                    // ),
                    // SizedBox(
                    //   height: screenHeight*0.01,
                    // ),
                    // Text(
                    //   'SLA DAYS',
                    //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenHeight*0.018),
                    // ),
                    // SizedBox(
                    //   height: screenHeight*0.01,
                    // ),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //     contentPadding: EdgeInsets.all(screenHeight*0.01),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(25),
                    //     ),
                    //     filled: true,
                    //     fillColor: Color(0xff9B5B5),
                    //     hintText: 'SLA DAYS',
                    //     hintStyle: TextStyle(color: Colors.grey, fontSize: screenHeight*0.016),
                    //   ),
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Please Enter Sla Days';  // Error message
                    //     }
                    //     return null;
                    //   },
                    // ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Text(
                      'DESCRIPTION',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenHeight * 0.018),
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Description'; // Error message
                        }
                        return null; // No error
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            top: screenHeight * 0.04,
                            bottom: screenHeight * 0.04,
                            left: screenWidth * 0.02),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(screenHeight * 0.02),
                        ),
                        filled: true,
                        fillColor: Color(0xff9B5B5),
                        hintText: 'Discription',
                        hintStyle: TextStyle(
                            color: Colors.grey, fontSize: screenHeight * 0.017),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    ImageUpload(),
                    // Column(
                    //   children: [
                    //     _image == null
                    //         ? Text('No image captured.')
                    //         : Container(
                    //       height: 100,
                    //          // color: Colors.red,
                    //           child: GridView.builder(
                    //             scrollDirection:Axis.horizontal,
                    //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //               crossAxisCount: 5,
                    //             ),
                    //             itemCount: _image.length,
                    //             itemBuilder: (context, index) {
                    //               return Container(
                    //                 padding: EdgeInsets.all(10),
                    //                 height: 100,
                    //                 width: 50,
                    //                 decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(10),
                    //                  // color: Colors.blueAccent
                    //                 ),
                    //                 child: Image.file(
                    //                   _image[index],
                    //                   fit: BoxFit.cover,
                    //                 ),
                    //               );
                    //             },
                    //           ),
                    //         ),
                    //     if (_imageError != null)
                    //       Padding(
                    //         padding:  EdgeInsets.only(top: screenHeight*0.01),
                    //         child: Text(
                    //           _imageError!,
                    //           style: TextStyle(color: Colors.red, fontSize: screenHeight*0.02),
                    //         ),
                    //       ),
                    //     SizedBox(
                    //       height: screenHeight*0.01,
                    //     ),
                    //     Center(
                    //       child: ElevatedButton(
                    //           onPressed: _showOptions,
                    //           style: ElevatedButton.styleFrom(
                    //               backgroundColor: Color(0xff415A8C)),
                    //           child: Text(
                    //             'UPLOAD PICTURE',
                    //             style: TextStyle(color: Colors.white, fontSize: screenHeight*0.018),
                    //           )),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          _validateAndSubmit();
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => TicketCreatedScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff4AA442),
                            minimumSize:
                                Size(screenWidth * 0.9, screenHeight * 0.05)),
                        child: Text(
                          'SUBMIT',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight * 0.02,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
