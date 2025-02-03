import "dart:math";
import "package:firstly/bases_buttons.dart";
import "package:flutter/material.dart";
import "package:firstly/nitrogenous_base.dart";

class MyGameScreen extends StatefulWidget {
  const MyGameScreen({super.key});

  @override
  State<MyGameScreen> createState() => _MyGameScreenState();
}

//
class _MyGameScreenState extends State<MyGameScreen> {
  //DNA STRAND CREATION
  List<NitrogenousBase> dnaStrand = [
    NitrogenousBase(baseType: "A"),
    NitrogenousBase(baseType: "T")
  ];
  String nucleotide = "";

  void createDNAstrand() {
    setState(
      () {
        int randomNumber;
        for (int i = 0; i <= 10; i++) {
          randomNumber = Random().nextInt(4);
          switch (randomNumber) {
            case 0:
              nucleotide = "A";
              break;
            case 1:
              nucleotide = "T";
              break;
            case 2:
              nucleotide = "C";
              break;
            case 3:
              nucleotide = "G";
            default:
          }
          dnaStrand.add(NitrogenousBase(baseType: nucleotide));
        }
      },
    );
  }

  final ScrollController _scrollController1 = ScrollController();
  int speedControl = 5;

  @override
  void initState() {
    super.initState();
    createDNAstrand();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      double minScrollExtent1 = _scrollController1.position.minScrollExtent;
      double maxScrollExtent1 = _scrollController1.position.maxScrollExtent;

      animateToMaxMin(maxScrollExtent1, minScrollExtent1, maxScrollExtent1,
          speedControl, _scrollController1);
    });
  }

  animateToMaxMin(double max, double min, double direction, int seconds,
      ScrollController scrollController) {
    scrollController
        .animateTo(direction,
            duration: Duration(seconds: seconds), curve: Curves.linear)
        .then((value) {
      direction = direction == max ? min : max;
      animateToMaxMin(max, min, direction, seconds, scrollController);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue[200],
              child: ListView.builder(
                controller: _scrollController1,
                scrollDirection: Axis.horizontal,
                itemCount: dnaStrand.length,
                itemBuilder: (context, index) {
                  return dnaStrand[index];
                },
              ),
            ),
          ),
          Expanded(
          child: Container(
            color: const Color.fromARGB(255, 245, 131, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(letter: "A"),
                MyButton(letter: "T"),
                MyButton(letter: "C"),
                MyButton(letter: "G"),
              ],
            ),
          ),
        ),
        ],
      ),
    );
  }
}
