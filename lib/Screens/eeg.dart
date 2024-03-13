import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class EegVerification extends StatefulWidget {
  const EegVerification({super.key});

  @override
  State<EegVerification> createState() => _EegVerificationState();
}

class _EegVerificationState extends State<EegVerification> {
  List<List<dynamic>> data = [];
  List<List<dynamic>> finalres = [];
  List<_SalesData> dataa = [
    _SalesData('Jan', 60.4454),
    _SalesData('Feb', 50.3432),
    _SalesData('Mar', 55.8353),
    _SalesData('Apr', 40.4365),
    _SalesData('May', 35.2342)
  ];
  String prediction = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F9FF),
      appBar: AppBar(
        backgroundColor: Color(0xffF5F9FF),
        automaticallyImplyLeading: false,
        title: Text(
          'ML Model',
          style: TextStyle(
              fontFamily: "Jost",
              color: Colors.black,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: GestureDetector(
              onTap: () async {
                FilePickerResult? result =
                    await FilePicker.platform.pickFiles();

                if (result != null) {
                  File file = File(result.files.single.path!);
                  final myData = await rootBundle.loadString(file.path);
                  List<List<dynamic>> csvTable =
                      CsvToListConverter().convert(myData);

                  data = csvTable;
                  print(data);
                  finalres = Result(data);
                  print(finalres);
                  // await login(csvTable);
                } else {
                  // User canceled the picker
                }
              },
              child: Card(
                child: Container(
                  alignment: Alignment.center,
                  height: 200,
                  width: 200,
                  child: Text(
                    "Upload CSV File",
                    style: TextStyle(fontSize: 20, fontFamily: "Poppins"),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                print(data);
                await login(data);
              },
              child: Text("Diagnose")),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text('Probability of the person being mentally challenged)'),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "${prediction.toString()}%",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Center(
            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                // Chart title
                title: ChartTitle(
                    text: 'Prediction Analysis',
                    textStyle: TextStyle(fontWeight: FontWeight.w600)),
                // Enable legend
                legend: Legend(isVisible: true),
                // Enable tooltip
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_SalesData, String>>[
                  LineSeries<_SalesData, String>(
                      dataSource: dataa,
                      xValueMapper: (_SalesData sales, _) => sales.year,
                      yValueMapper: (_SalesData sales, _) => sales.sales,
                      name: 'Prediction',
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ]),
          ),
          // ElevatedButton(
          //     onPressed: () async {
          //       FilePickerResult? result =
          //           await FilePicker.platform.pickFiles();

          //       if (result != null) {
          //         File file = File(result.files.single.path!);
          //         final myData = await rootBundle.loadString(file.path);
          //         List<List<dynamic>> csvTable =
          //             CsvToListConverter().convert(myData);

          //         data = csvTable;
          //         // print(data);
          //         finalres = Result(data);
          //         print(finalres);
          //       } else {
          //         // User canceled the picker
          //       }
          //     },
          //     child: Text('hello')),
          // ElevatedButton(
          //     onPressed: () async {
          //       print(data);
          //       await login(data);
          //     },
          //     child: Text("hahhha"))
        ],
      ),
    );
  }

  List<List<dynamic>> Result(List<List<dynamic>> arr) {
    List<List<dynamic>> finalresult = [];
    for (int i = 0; i < 25; i++) {
      for (int j = 0; j < 25; j++) {
        finalresult[i - 1].add(arr[i][j]);
      }
    }
    print(finalresult);
    return finalresult;
  }

  login(List<List<dynamic>> res) async {
    try {
      Response response = await post(
        Uri.parse("https://c7cc-210-212-97-172.ngrok-free.app/predict"),
        headers: {
          'Content-Type': "application/json",
        },
        body: jsonEncode(
          {"input_data": res},
        ),
      );

      if (response.statusCode == 200) {
        // otherpage = '1';
        var data = jsonDecode(response.body.toString());
        setState(() {
          double jack = data['prediction'][0][0];
          prediction = jack.toString();
        });
        print(data['prediction'].toString());
        print('Login successfully');
      } else {
        print('failed');
      }
      print(response.statusCode);
    } catch (e) {
      print(e.toString());
    }
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
