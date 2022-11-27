import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String name, location, imgpath, date, unit, status;
  final int qte;

  const DetailPage(
      {super.key,
      this.imgpath = "",
      this.name = "",
      this.qte = 0,
      this.location = "",
      this.date = "",
      this.unit = "",
      this.status = ""});
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 109, 196, 112),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          'Les demandes',
          style: TextStyle(
              fontFamily: 'Montserrat', fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
            color: Colors.white,
          )
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                top: 75.0,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45.0),
                      topRight: Radius.circular(45.0),
                    ),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Positioned(
                top: 30.0,
                left: (MediaQuery.of(context).size.width / 3),
                child: Hero(
                  tag: widget.imgpath,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.imgpath),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 130.0,
                    width: 130.0,
                  ),
                ),
              ),
              Positioned(
                  top: 250.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text.rich(
                        TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.location_on_outlined,
                                color: Colors.blueAccent,
                              ),
                            ),
                            TextSpan(text: ""),
                          ],
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Text.rich(TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.production_quantity_limits,
                              color: Colors.blueAccent,
                            ),
                          ),
                          TextSpan(text: " 20kg"),
                        ],
                      )),
                      SizedBox(height: 25.0),
                      Text.rich(TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.car_crash,
                              color: Colors.blueAccent,
                            ),
                          ),
                          TextSpan(text: "  En cours de préparation"),
                        ],
                      )),
                      SizedBox(height: 25.0),
                      Text.rich(TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.date_range_outlined,
                              color: Colors.blueAccent,
                            ),
                          ),
                          TextSpan(
                            text: "14/11/2022",
                            style: TextStyle(),
                          ),
                        ],
                      ))
                    ],
                  ))
            ],
          ),
          // Column(children: [Text("data")]),
        ],
      ),
    );
  }
}
