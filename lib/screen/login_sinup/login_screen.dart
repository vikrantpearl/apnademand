import 'package:appecom/screen/login_sinup/sinup_sceen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/colors.dart';
import '../../widget/custem_button.dart';
import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _numberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _phoneCode = '+1'; // Define yor defa
  late String phoneNumber, verificationId;
  late String otp, authStatus = "";

  Future<void> verifyPhoneNumber(BuildContext context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 15),
      verificationCompleted: (AuthCredential authCredential) {
        setState(() {
          authStatus = "Your account is successfully verified";
        });
      },
      // verificationFailed: (AuthException authException) {

      // },
      // codeSent: (String verId, [int forceCodeResent]) {

      // },
      codeAutoRetrievalTimeout: (String verId) {
        verificationId = verId;
        setState(() {
          authStatus = "TIMEOUT";
        });
      },
      verificationFailed: (FirebaseAuthException error) {
        setState(() {
          authStatus = "Authentication failed";
        });
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        verificationId = verificationId;
        setState(() {
          authStatus = "OTP has been successfully send";
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeaderWidget(),
                SizedBox(
                  height: 80.h,
                ),
                loginFromWidget()
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

  Widget loginFromWidget() {
    bool passwordVisible = false;

    @override
    void initState() {
      super.initState();
      passwordVisible = true;
    }

    return Center(
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Phone Number",
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: double.infinity,
              height: 45.h,
              child: Form(
                key: _formKey,
                child: TextFormField(
                  controller: _numberController,
                  decoration: const InputDecoration(
                    labelText: "Phone Number",
                    // hintText: "enter_your_number",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    // prefixIcon: Padding(
                    //   padding: const EdgeInsets.only(left: 8.0),
                    //   child: CountryCodePicker(
                    //       alignLeft: false,
                    //       initialSelection: _initialSelection,
                    //       onChanged: (country) {
                    //         /// Get country code
                    //         _phoneCode = country.dialCode!;
                    //       }),
                    // )
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                  ],
                  validator: (number) {
                    // Basic validation
                    if (number == null || number.isEmpty) {
                      return ("please_enter_your_phone_number");
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  _numberController == null
                      ? null
                      : Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OTPScreen()),
                        );
                }
              },
              child: Container(
                width: double.infinity,
                height: 43.h,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(
                    child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                )),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(children: <Widget>[
              const Expanded(child: Divider()),
              SizedBox(
                width: 10.w,
              ),
              const Text("OR"),
              SizedBox(
                width: 10.w,
              ),
              const Expanded(child: Divider()),
            ]),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: double.infinity,
              height: 49.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/svg/devicon_google.svg"),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "Sign up with Google",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF919191))),
            ),
          ],
        ),
      ),
    );
  }
}
