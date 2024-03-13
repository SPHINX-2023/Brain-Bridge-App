import 'dart:convert';

import 'package:brainbridge/Screens/games_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  final aadhar;
  const OtpScreen({super.key, this.aadhar});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: Colors.black),
      ),
    );
    const focusedBorderColor = Color(0xff6979F8);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color(0xff6979F8);
    return Scaffold(
      backgroundColor: Color(0xffF5F9FF),
      appBar: AppBar(
        backgroundColor: Color(0xffF5F9FF),
        automaticallyImplyLeading: false,
        title: Text(
          'OTP Verification',
          style: TextStyle(
              fontFamily: "Jost",
              color: Colors.black,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Center(
              child: Text(
                'OTP sent successfully',
                style: TextStyle(
                  color: Color(0xff545454),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Pinput(
              obscureText: true,
              length: 6,
              controller: pinController,
              focusNode: focusNode,
              androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
              listenForMultipleSmsOnAndroid: true,
              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) => const SizedBox(width: 8),

              // onClipboardFound: (value) {
              //   debugPrint('onClipboardFound: $value');
              //   pinController.setText(value);
              // },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                debugPrint('onCompleted: $pin');
              },
              onChanged: (value) {
                debugPrint('onChanged: $value');
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color: focusedBorderColor,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              width: width * 0.8,
              height: height * 0.07,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xff6979F8))),
                  onPressed: () async {
                    await login(pinController.text);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GamesScreen()));
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: width * 0.2,
                      ),
                      Text(
                        'Sign In',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: width * 0.155,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                            color: Color(0xff6979F8),
                            onPressed: () async {
                              String res = await login(pinController.text);
                              // if (res == "Success")
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GamesScreen()));
                            },
                            icon: Icon(Icons.arrow_forward)),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  Future<String> login(String otp) async {
    try {
      Response response = await post(
        Uri.parse("https://votingapp-qa3x.onrender.com/user/verifyotp"),
        headers: {
          'Content-Type': "application/json",
        },
        body: jsonEncode(
          {"AadharNumber": widget.aadhar, "OTP": otp},
        ),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Login successfully');
        return "Success";
      } else {
        print('failed');
        return "Fail";
      }
      print(response.statusCode);
    } catch (e) {
      print(e.toString());
      return (e.toString());
    }
  }
}
