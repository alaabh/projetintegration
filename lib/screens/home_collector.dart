import 'package:flutter/material.dart';

import 'deatil_page_collector.dart';

class HomeCollector extends StatefulWidget {
  HomeCollector({Key? key}) : super(key: key);

  @override
  State<HomeCollector> createState() => _HomeCollectorState();
}

class _HomeCollectorState extends State<HomeCollector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 109, 196, 112),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  Container(
                    width: 125.0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[]),
                  )
                ]),
          ),
          const SizedBox(height: 25.0),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Row(children: const [
              Text(
                "Liste des demandes ",
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0),
              ),
            ]),
          ),
          const SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: const EdgeInsets.only(left: 25.0, right: 20.0),
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 45.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 300.0,
                    child: ListView(
                      children: [
                        _ProductItem("assets/images/paper.png", "carton", 10,
                            "tunis", "14/11/2022", "unit", "status"),
                        _ProductItem("assets/images/bottle.png", "plastique",
                            10, "tunis", "13/11/2022", "unit", "status"),
                        _ProductItem("assets/images/glass.png", "verre", 10,
                            "tunis", "12/11/2022", "unit", "status"),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _ProductItem(String imgpath, String name, int quantite,
      String location, String date, String unit, String status) {
    return Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailPage(
                      imgpath: imgpath,
                      name: name,
                      qte: quantite,
                      location: location,
                      date: date,
                      unit: unit,
                      status: status,
                      //  name, qte, location, imgpath,date,unit,status;
                    )));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Hero(
                      tag: imgpath,
                      child: Image(
                        image: AssetImage(imgpath),
                        fit: BoxFit.fill,
                        height: 75.0,
                        width: 75.0,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontFamily: 'Montserat',
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$quantite kg",
                          style: const TextStyle(
                            fontFamily: 'Montserat',
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$date ",
                          style: const TextStyle(
                            fontFamily: 'Montserat',
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
