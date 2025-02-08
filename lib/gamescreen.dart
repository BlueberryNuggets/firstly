import "dart:math";
import "package:firstly/bases_buttons.dart";
import "package:flutter/material.dart";
import "package:firstly/nitrogenous_base.dart";

class MyGameScreen extends StatefulWidget {
  const MyGameScreen({super.key});

  @override
  State<MyGameScreen> createState() => _MyGameScreenState();
}

class _MyGameScreenState extends State<MyGameScreen> {
  int answerItem = 0;
  List<NitrogenousBase> dnaStrand = [];

  @override
  void initState() {
    super.initState();
    createDNAstrand();
  }

  void createDNAstrand() {
    setState(() {
      dnaStrand.clear();
      for (int i = 0; i < 11; i++) {
        final randomNumber = Random().nextInt(4);
        String nucleotide = "";
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
            break;
        }
        dnaStrand.add(NitrogenousBase(baseType: nucleotide, baseChosen: ""));
      }
    });
  }


  final ScrollController _scrollController1 = ScrollController();
  int speedControl = 5;

  // @override
  // void initState() {
  //   super.initState();
  //   createDNAstrand();
  // //   WidgetsBinding.instance.addPostFrameCallback((timestamp) {
  // //     double minScrollExtent1 = _scrollController1.position.minScrollExtent;
  // //     double maxScrollExtent1 = _scrollController1.position.maxScrollExtent;

  // //     animateToMaxMin(maxScrollExtent1, minScrollExtent1, maxScrollExtent1,
  // //         speedControl, _scrollController1);
  // //   });
  // // }

  // // animateToMaxMin(double max, double min, double direction, int seconds,
  // //     ScrollController scrollController) {
  // //   scrollController
  // //       .animateTo(direction,
  // //           duration: Duration(seconds: seconds), curve: Curves.linear);
  //   //     .then((value) {
  //   //   direction = direction == max ? min : max;
  //   //   animateToMaxMin(max, min, direction, seconds, scrollController);
  //   // });
  // }

  void adenine() {
    _updateBaseAtIndex(answerItem, "A");
  }

  void thymine() {
    _updateBaseAtIndex(answerItem, "T");
  }

  void guanine() {
    _updateBaseAtIndex(answerItem, "G");
  }

  void cytosine() {
    _updateBaseAtIndex(answerItem, "C");
  }

 void _updateBaseAtIndex(int index, String base) {
    if (index >= 0 && index < dnaStrand.length) {
      // Create a *new* list with the updated item
      List<NitrogenousBase> newDnaStrand = List.from(dnaStrand); // Create a copy
      newDnaStrand[index] = NitrogenousBase(
        baseType: dnaStrand[index].baseType,
        baseChosen: base,
      ); // Update the copy
      setState(() {
        dnaStrand = newDnaStrand; // Assign the new list to dnaStrand
        answerItem++;
        if (answerItem >= dnaStrand.length) {
          answerItem = dnaStrand.length - 1;
        }
      });
    }
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
                MyButton(letter: "A", function: adenine),
                MyButton(letter: "T", function: thymine),
                MyButton(letter: "C", function: cytosine),
                MyButton(letter: "G", function: guanine),
              ],
            ),
          ),
        ),
        ],
      ),
    );
  }
}
