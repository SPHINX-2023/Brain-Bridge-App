import 'package:brainbridge/Screens/Games/Sudoku/sudoku.dart';
import 'package:brainbridge/Screens/Games/Ticktaktoe/TickTackToeBoard.dart';
import 'package:brainbridge/Screens/eeg.dart';
import 'package:brainbridge/games/cuttherope/cut_the_rope_page.dart';
import 'package:brainbridge/games/fallblocks/fallblocks_page.dart';
import 'package:brainbridge/provider/counter.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GamesScreen extends StatefulWidget {
  const GamesScreen({Key? key}) : super(key: key);

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final countProvider = Provider.of<CountProvider>(context, listen: false);
      countProvider.resetCount();
    });
  }

  int progress = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 289,
              color: Color(0xff6979fb),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/Pic.png"),
                      Column(
                        children: [
                          Text(
                            "You're almost there !",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Tasks left to defeat",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Consumer<CountProvider>(
                              builder: (context, counter, child) {
                            return Text(
                              (5 - counter.count).toString(),
                              style: Theme.of(context).textTheme.headline4,
                            );
                          }),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Consumer<CountProvider>(builder: (context, counter, child) {
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(32.0, 0, 0, 0),
                        child: LinearPercentIndicator(
                          width: MediaQuery.of(context).size.width * 0.8,
                          lineHeight: 20,
                          percent: counter.count * 2 / 10,
                          animation: true,
                          animationDuration: 1500,
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          progressColor: Colors.green,
                          backgroundColor: Colors.grey[300],
                          barRadius: const Radius.circular(16),
                        ),
                      ),
                    );
                  }),
                  Consumer<CountProvider>(builder: (context, counter, child) {
                    return Text(
                      counter.count.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    );
                  }),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Games",
              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MyHomePage(title: "Sudoku Solver")));
                },
                child: Image.asset(
                  "assets/sudoku.png",
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    "assets/ticktack.png",
                    width: MediaQuery.of(context).size.width * 0.4,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ]),
            SizedBox(
              height: 15,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CutTheRopePage()));
                },
                child: Image.asset(
                  "assets/cuttherope/sprites/icon.png",
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FallBlocksPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    "assets/fallblocks/sprites/icon.jpg",
                    width: MediaQuery.of(context).size.width * 0.4,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ]),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EegVerification()));
              },
              child: Container(
                width: 250,
                height: 65,
                decoration: BoxDecoration(
                    color: Color(0xff6979fb),
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                  child: Text(
                    "Diagnosis",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

Future getScore() async {
  http.Response response = await http.get(
      Uri.parse("https://brainbridge-backend.onrender.com/score"),);
  if (response.statusCode == 200) {
    String data = response.body;
    print(data);
    return jsonDecode(data);
  } else {
    print(response.statusCode);
    print(response.body);
  }
}

}
