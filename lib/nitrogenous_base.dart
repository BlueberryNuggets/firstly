import "package:flutter/material.dart";

class NitrogenousBase extends StatefulWidget {
  final String baseType;
  String baseChosen;
  NitrogenousBase({required this.baseType, required this.baseChosen, super.key});

  @override
  State<NitrogenousBase> createState() => _NitrogenousBaseState();
}

class _NitrogenousBaseState extends State<NitrogenousBase> {
  String complementaryBaseType = "";
  List<Color> dnabaseColor = [
    Colors.blue, //A
    Colors.amber, //T
    Colors.green, //C
    Colors.deepPurple, //G
    Colors.transparent
  ];
  int basecolorIndex = 0;
  int complementcolorindex = 4;

  @override
  void initState() {
    super.initState();
    _updateBaseColors();
  }

 @override
  void didUpdateWidget(covariant NitrogenousBase oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.baseChosen != widget.baseChosen) {
      _updateBaseColors();
    }
  }


  void _updateBaseColors() {
    if (widget.baseType == "A") {
      complementaryBaseType = "T";
      basecolorIndex = 0;
    } else if (widget.baseType == "T") {
      complementaryBaseType = "A";
      basecolorIndex = 1;
    } else if (widget.baseType == "C") {
      complementaryBaseType = "G";
      basecolorIndex = 2;
    } else if (widget.baseType == "G") {
      complementaryBaseType = "C";
      basecolorIndex = 3;
    }

    if (widget.baseChosen == "A") {
      complementcolorindex = 0;
    } else if (widget.baseChosen == "T") {
      complementcolorindex = 1;
    } else if (widget.baseChosen == "C") {
      complementcolorindex = 2;
    } else if (widget.baseChosen == "G") {
      complementcolorindex = 3;
    } else {
      complementcolorindex = 4; // Default color if baseChosen is empty
    }

    setState(() {}); // Rebuild to reflect color changes
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
            color: dnabaseColor[complementcolorindex],
            width: 50,
            height: 200,
            child: Text(widget.baseChosen),
          ),
        ],
      ),
    );
  }
}