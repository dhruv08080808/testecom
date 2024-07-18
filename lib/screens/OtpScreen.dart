import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  final String? verificationId;
  const OtpScreen({super.key, this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState(verificationId);
}

class _OtpScreenState extends State<OtpScreen> {
  final String? verificationId;
  _OtpScreenState(this.verificationId);

  TextEditingController otpTextC = TextEditingController();

  final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
          borderRadius: BorderRadius.circular(20)));

  final focusedPinTheme = PinTheme(
          width: 56,
          height: 56,
          textStyle: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(30, 60, 87, 1),
              fontWeight: FontWeight.w600),
          decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
              borderRadius: BorderRadius.circular(20)))
      .copyDecorationWith(
          border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
          borderRadius: BorderRadius.circular(8));

  final submittedPinTheme = PinTheme(
          width: 56,
          height: 56,
          textStyle: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(30, 60, 87, 1),
              fontWeight: FontWeight.w600),
          decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
              borderRadius: BorderRadius.circular(20)))
      .copyWith(
    decoration: PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    ).decoration!.copyWith(
          color: Color.fromRGBO(234, 239, 243, 1),
        ),
  );

  verifyOtp() async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      // Update the UI - wait for the user to enter the SMS code
      String smsCode = otpTextC.text.trim();

      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId!, smsCode: smsCode);

      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(credential);

      print("OTP verified successfully");
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          SizedBox(height: 170),
          Pinput(
            length: 6,
            controller: otpTextC,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            submittedPinTheme: submittedPinTheme,
            // validator: (s) {
            //   return s == '2222' ? null : 'Pin is incorrect';
            // },
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            showCursor: true,
            onCompleted: (pin) => print(pin),
          ),
          SizedBox(height: 70),
          Container(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.amber)),
                  onPressed: () {
                    verifyOtp();
                  },
                  child: Text('Submit Otp'))),
        ]),
      ),
    );
  }
}
