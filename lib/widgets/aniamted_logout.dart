import 'package:flutter/material.dart';

class MyCustomWidget extends StatefulWidget {
  const MyCustomWidget({super.key});

  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget>
    with TickerProviderStateMixin {
  bool isTapped = true;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: FoldableOptions(),
    );
  }
}

class FoldableOptions extends StatefulWidget {
  @override
  _FoldableOptionsState createState() => _FoldableOptionsState();
}

class _FoldableOptionsState extends State<FoldableOptions>
    with SingleTickerProviderStateMixin {
  final List<IconData> options = [
    Icons.settings,
    Icons.person,
    Icons.favorite,
  ];

  late Animation<Alignment> firstAnim;
  late Animation<Alignment> secondAnim;
  late Animation<Alignment> thirdAnim;

  late Animation<double> verticalPadding;
  late AnimationController controller;
  final duration = Duration(milliseconds: 190);

  Widget getItem(IconData source) {
    final size = 45.0;
    return GestureDetector(
      onTap: () {
        controller.reverse();
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Color(0XFFE95A8B),
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        child: Icon(
          source,
          color: Colors.white.withOpacity(1.0),
          size: 20,
        ),
      ),
    );
  }

  Widget buildPrimaryItem(IconData source) {
    final size = 45.0;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Color(0XFFE95A8B),
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
              color: Color(0XFFE95A8B).withOpacity(0.8),
              blurRadius: verticalPadding.value),
        ],
      ),
      child: Icon(
        source,
        color: Colors.white.withOpacity(1),
        size: 20,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: duration);

    final anim = CurvedAnimation(parent: controller, curve: Curves.linear);
    firstAnim =
        Tween<Alignment>(begin: Alignment.centerRight, end: Alignment.topRight)
            .animate(anim);
    secondAnim = Tween<Alignment>(
            begin: Alignment.centerRight, end: Alignment.centerLeft)
        .animate(anim);
    thirdAnim = Tween<Alignment>(
            begin: Alignment.centerRight, end: Alignment.bottomRight)
        .animate(anim);

    verticalPadding = Tween<double>(begin: 0, end: 5).animate(anim);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 210,
      margin: EdgeInsets.only(right: 15),
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Stack(
            children: <Widget>[
              Align(
                alignment: firstAnim.value,
                child: getItem(
                  options.elementAt(0),
                ),
              ),
              Align(
                alignment: secondAnim.value,
                child: Container(
                  padding:
                      EdgeInsets.only(left: 37, top: verticalPadding.value),
                  child: getItem(
                    options.elementAt(1),
                  ),
                ),
              ),
              Align(
                alignment: thirdAnim.value,
                child: getItem(
                  options.elementAt(2),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    controller.isCompleted
                        ? controller.reverse()
                        : controller.forward();
                  },
                  child: buildPrimaryItem(
                    controller.isCompleted || controller.isAnimating
                        ? Icons.close
                        : Icons.add,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
