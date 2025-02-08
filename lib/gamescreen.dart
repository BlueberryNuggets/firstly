// gamescreen.dart
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
  int score = 0; // Initialize score to 0

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
      answerItem = 0; // Reset answerItem when creating a new strand
      score = 0; // Reset score when creating a new strand
    });
  }

  final ScrollController _scrollController1 = ScrollController();
  int speedControl = 5;


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
      String correctBase = "";
      switch (dnaStrand[index].baseType) {
        case "A":
          correctBase = "T";
          break;
        case "T":
          correctBase = "A";
          break;
        case "C":
          correctBase = "G";
          break;
        case "G":
          correctBase = "C";
          break;
      }

      List<NitrogenousBase> newDnaStrand = List.from(dnaStrand);
      newDnaStrand[index] = NitrogenousBase(
        baseType: dnaStrand[index].baseType,
        baseChosen: base,
      );
      setState(() {
        dnaStrand = newDnaStrand;
        if (base == correctBase) {
          score += 100;
        } else {
          score -= 50;
        }
        answerItem++;
        if (answerItem >= dnaStrand.length) {
          answerItem = dnaStrand.length -1;
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
          // Display the score
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Score: $score",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          ElevatedButton(
            onPressed: createDNAstrand, // Call createDNAstrand to reset
            child: const Text('Reset'),
          ),

        ],
      ),
    );
  }
}


// nitrogenousBase.dart (No changes needed here)
// ... (Your existing nitrogenousBase.dart code)