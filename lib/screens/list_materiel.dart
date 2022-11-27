import 'package:flutter/material.dart';

import 'package:number_selection/number_selection.dart';
import 'package:location/location.dart';

import 'package:get/get.dart';

import 'custom_shape.dart';

class ListMaterial extends StatefulWidget {
  const ListMaterial({Key? key}) : super(key: key);

  @override
  _ListMaterialState createState() => _ListMaterialState();
}

class _ListMaterialState extends State<ListMaterial> {
  int _currentValue = 3;
  Location location = new Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  bool _isListenLocation = false, _isGetLocation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: Customshape(),
          child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [Color(0xff4ABB47), Color(0xff97D136)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ))),
        ),
      ),
      body: SafeArea(
          child: GridView.builder(
              itemCount: gridlist.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      gridlist[index].selected = !gridlist[index].selected;
                    });
                    Get.defaultDialog(
                      title: "Make a recycle request",
                      backgroundColor: Colors.white,
                      titleStyle: const TextStyle(
                        color: Color(0xff97D136),
                      ),
                      middleTextStyle: const TextStyle(
                        color: Color(0xff97D136),
                      ),
                      textConfirm: "Confirm",
                      textCancel: "Cancel",
                      cancelTextColor: Color(0xff97D136),
                      confirmTextColor: Colors.white,
                      buttonColor: Color(0xff4ABB47),
                      onConfirm: () {
                        setState(() {
                          Get.back();
                          gridlist[index].selected = !gridlist[index].selected;
                        });
                      },
                      onCancel: () {
                        setState(() {
                          gridlist[index].selected = !gridlist[index].selected;
                        });
                      },
                      barrierDismissible: false,
                      radius: 50,
                      content: SizedBox(
                        width: 220,
                        height: 200,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Expanded(
                                child: TextField(
                                  maxLines: null,
                                  expands: true,
                                  decoration: InputDecoration(
                                    labelText: "Describe the material",
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text("Quantity (kg) :  "),
                                  SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: NumberSelection(
                                        theme: NumberSelectionTheme(
                                          draggableCircleColor:
                                              Color(0xff97D136),
                                          iconsColor: Colors.white,
                                          numberColor: Colors.white,
                                          backgroundColor: Color(0xff4ABB47),
                                        ),
                                        initialValue: 1,
                                        minValue: -10,
                                        maxValue: 10,
                                        direction: Axis.horizontal,
                                        withSpring: true,
                                        onChanged: (int value) =>
                                            print("value: $value"),
                                        enableOnOutOfConstraintsAnimation: true,
                                      )),
                                ],
                              ),
                            ]),
                      ),
                    );
                  },
                  child: Card(
                    color: gridlist[index].selected
                        ? Color.fromARGB(255, 129, 243, 125)
                        : Colors.white,
                    elevation: 10,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              child: SizedBox(
                                  height: 150.0,
                                  width: 100.0,
                                  child: gridlist[index].image)),
                          SizedBox(
                              height: 30,
                              child: Text(
                                gridlist[index].title.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}

class GridData {
  String? title;
  Widget? image;
  bool selected;
  GridData(
    this.title,
    this.image,
    this.selected,
  );
}

final List<GridData> gridlist = [
  GridData(
      "Plastic", Image(image: AssetImage('assets/images/bottle.png')), false),
  GridData(
      "Organics", Image(image: AssetImage('assets/images/apple.png')), false),
  GridData("Glass", Image(image: AssetImage('assets/images/glass.png')), false),
  GridData("Metal", Image(image: AssetImage('assets/images/metal.png')), false),
  GridData("Paper", Image(image: AssetImage('assets/images/paper.png')), false),
  GridData("Other", Image(image: AssetImage('assets/images/other.png')), false),
];
