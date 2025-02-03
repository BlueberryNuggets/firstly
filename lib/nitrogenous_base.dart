import "package:flutter/material.dart";

class NitrogenousBase extends StatefulWidget {
  final String baseType;
  final String answer;
  const NitrogenousBase({required this.baseType, required this.answer, super.key});
 
  @override
  State<NitrogenousBase> createState() => _NitrogenousBaseState();
}

class _NitrogenousBaseState extends State<NitrogenousBase> {
  String complementaryBaseType = "";
  List<Color> dnabaseColor = [
    Colors.blue,
    Colors.amber,
    Colors.green,
    Colors.deepPurple,
    Colors.transparent
  ];
  int basecolorIndex = 0;
  int complementcolorindex = 4;

@override
  void initState() {
    super.initState();
    pairingChecker();
    }

  //pairing function
  void pairingChecker() {
    setState(() {
      if (widget.baseType == "A") {
        complementaryBaseType = "T";
        basecolorIndex = 0;
        complementcolorindex = 1;
      } else if (widget.baseType == "T") {
        complementaryBaseType = "A";
        basecolorIndex = 1;
        complementcolorindex = 0;
      } else if (widget.baseType == "C") {
        complementaryBaseType = "G";
        basecolorIndex = 2;
        complementcolorindex = 3;
      } else if (widget.baseType == "G") {
        complementaryBaseType = "C";
        basecolorIndex = 3;
        complementcolorindex = 2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Container(
            color: dnabaseColor[basecolorIndex],
            alignment: Alignment.center,
            width: 50,
            height: 100,
            child: Text(
              widget.baseType,
            ),
          ),
          Container(
            color: dnabaseColor[4],
            width: 50,
            height: 200,
            child: Text("?"),
          ),
        ],
      ),
    );
  }
}
