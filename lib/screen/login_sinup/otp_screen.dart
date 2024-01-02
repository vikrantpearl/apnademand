import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../mainpage/mainscreen.dart';
import '../../widget/bottomnavigation.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeaderWidget(),
                SizedBox(
                  height: 80.h,
                ),
                otpFfromFromWidget()
               // loginFromWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget HeaderWidget() {
    return Row(
      children: [Image.asset("assets/logo.png")],
    );
  }
  Widget otpFfromFromWidget(){
    return Form(child: Column(
      children: [

        const Text(
          'OTP Veritification',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,

            fontWeight: FontWeight.w500,


          ),
        ),
        SizedBox(
          width: 370.w,
          height: 50.h,
          child: const Text(
            'We have an OTP on given number +62 987 987 23 22',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF919191),
              fontSize: 16,

              fontWeight: FontWeight.w400,

            ),
          ),
        ),
        const SizedBox(
          width: 370,
          height: 20,
          child: Text(
            '03:00',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF319F43),
              fontSize: 12,

              fontWeight: FontWeight.w600,

            ),
          ),
        ),
        OTPTextField(
          length: 5,
          width: MediaQuery.of(context).size.width,
          fieldWidth: 40,
          style: const TextStyle(
              fontSize: 17
          ),
          textFieldAlignment: MainAxisAlignment.spaceAround,
          fieldStyle: FieldStyle.underline,
          onCompleted: (pin) {
            if (kDebugMode) {
              print("Completed: " + pin);
            }
          },
        ),
        SizedBox(height: 32.h,),
        InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  BottomNavigation()),
            );
          },
          child: Container(
            width: 371.w,
            height: 48.h,
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
            decoration: ShapeDecoration(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Next',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,

                    fontWeight: FontWeight.w600,
                    height: 0.14,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
