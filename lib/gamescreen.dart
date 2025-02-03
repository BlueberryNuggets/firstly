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
  String answer = "";
  //DNA STRAND CREATION
  List<NitrogenousBase> dnaStrand = [
    NitrogenousBase(baseType: "A", answer: "",),
    NitrogenousBase(baseType: "T", answer: "")
  ];
  String nucleotide = "";

    void createBases() {
      setState(() {
        for (int i = 0; i <= 10; i++) {
        dnaStrand.elementAt(i).answer == answer;
      }});
    }

  String button1 = "A";
  String button2 = "T";
  String button3 = "C";
  String button4 = "G";

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
          dnaStrand.add(NitrogenousBase(baseType: nucleotide, answer:""));
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
            duration: Duration(seconds: seconds), curve: Curves.linear);
    //     .then((value) {
    //   direction = direction == max ? min : max;
    //   animateToMaxMin(max, min, direction, seconds, scrollController);
    // });
  }

  void buttonA(){
    setState(() {
      answer = button1; 
    });
  }
   void buttonT(){
    setState(() {
      answer = button2; 
    });
  }
   void buttonC(){
    setState(() {
      answer = button3; 
    });
  }
   void buttonG(){
    setState(() {
      answer = button4; 
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.pink[200],
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
                MyButton(letter: button1, function: buttonA),
                MyButton(letter: button2, function: buttonT),
                MyButton(letter: button3, function: buttonC),
                MyButton(letter: button4, function: buttonG),
              ],
            ),
          ),
        ),
        ],
      ),
    );
  }
}
