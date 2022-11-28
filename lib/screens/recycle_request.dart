import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecycleRequest extends StatefulWidget {
  RecycleRequest({Key? key}) : super(key: key);

  @override
  State<RecycleRequest> createState() => _RecycleRequestState();
}

class _RecycleRequestState extends State<RecycleRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Recycle Requests',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: datalist.length,
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 2, color: Colors.amberAccent),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  tileColor: Colors.white,
                                  leading: Text(
                                    datalist[index].material,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  trailing: const Icon(Icons.delete),
                                  title: Text(
                                    datalist[index].quantity,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    datalist[index].adresse,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ])),
        ),
        backgroundColor: Color(0xff97D136));
  }
}

class ListData {
  String quantity;
  String material;
  String adresse;
  ListData(
    this.quantity,
    this.material,
    this.adresse,
  );
}

final List<ListData> datalist = [
  ListData("1Kg", "Plastic", "12 mourouj5,benarous,tunis"),
  ListData("1.8Kg", "Organics", "12 mourouj5,benarous,tunis"),
  ListData("10Kg", "Metal", "12 mourouj5,benarous,tunis"),
  ListData("6Kg", "Glass", "12 mourouj5,benarous,tunis"),
  ListData("3Kg", "paper", "12 mourouj5,benarous,tunis"),
];
