import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projet_integration/widgets/aniamted_logout.dart';
import 'package:projet_integration/widgets/boxes_coin.dart';
import 'package:projet_integration/widgets/pie.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: Get.width * 1,
            height: 150,
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              children: <Widget>[
                Container(
                  width: 150,
                  height: 100,
                  color: Color(0xff6ae792),
                ), //Container
                Positioned(
                  top: 100,
                  left: 80,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 238, 247, 241),
                    ),
                    width: 250,
                    height: 100,
                    child: coin(),
                  ),
                ),
                //Container
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PieChartWidget(),
              ],
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: MyCustomWidget(),
            ),
          )
        ],
      ),
    );
  }
}

Widget coin() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      BoxCoins(image: "assets/images/coin.png", text: "coins", text1: "4000"),
      VerticalDivider(
        width: 30,
        indent: 30,
        endIndent: 30,
        color: Colors.black38,
      ),
      BoxCoins(image: "assets/images/coin.png", text: "coins", text1: "4000"),
      VerticalDivider(
        width: 30,
        indent: 30,
        endIndent: 30,
        color: Colors.black38,
      ),
      BoxCoins(image: "assets/images/coin.png", text: "coins", text1: "4000"),
    ],
  );
}
