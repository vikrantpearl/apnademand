import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Sinup_Screen extends StatefulWidget {
  const Sinup_Screen({Key? key}) : super(key: key);

  @override
  State<Sinup_Screen> createState() => _Sinup_ScreenState();
}

class _Sinup_ScreenState extends State<Sinup_Screen> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWidget(),
              SizedBox(height: 36.h,),
              sinupFromWidget()
            ],
          ),
        ),
      )),
    );
  }
  Widget HeaderWidget() {
    return Row(
      children: [Image.asset("assets/logo.png")],
    );
  }
  Widget sinupFromWidget() {
    bool passwordVisible = false;
    bool rememberMe = false;
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
              "Email",
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400 ,
                  color: Colors.black),
            ),
            SizedBox(
              width: double.infinity,
              height: 45.h,
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "vikrantbhawani2020@gmail.com",
                    hintStyle: TextStyle(color: Color(0xFF919191),fontWeight: FontWeight.w400,fontSize: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.sp))),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Password",
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            SizedBox(
              width: double.infinity,
              height: 45.h,
              child: TextFormField(
                obscureText: passwordVisible,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    hintText: "********",
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(
                              () {
                            passwordVisible = !passwordVisible;
                          },
                        );
                      },
                    ),
                    hintStyle: const TextStyle(color: Color(0xFF919191)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.sp))),
              ),
            ),
            const Text(
              'The password must be at least 8 characters long, and consists of letters and numbers, only the -_.@ symbol can be used',
              style: TextStyle(
                color: Color(0xFF919191),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,

              ),
            ),
            SizedBox(height: 14.h,),
            Text(
              "Postal Code",
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            SizedBox(
              width: double.infinity,
              height: 45.h,
              child: TextFormField(
                obscureText: passwordVisible,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    hintText: " Please enter postal code",

                    hintStyle: const TextStyle( color: Color(0xFF919191),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.sp))),
              ),
            ),
            SizedBox(height: 14.h,),
            Text(
              "Date of birth",
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            SizedBox(
              width: double.infinity,
              height: 45.h,
              child: TextFormField(
                obscureText: passwordVisible,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    hintText: " ",
                    suffixIcon: IconButton(
                      icon: const Icon(  Icons.calendar_month
                           ),
                      onPressed: () {
                        setState(
                              () {
                            passwordVisible = !passwordVisible;
                          },
                        );
                      },
                    ),
                    hintStyle: TextStyle(color: Color(0xFF919191)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.sp))),
              ),
            ),
            const Text(
              'Cannot change your date of birth once you have registered',
              style: TextStyle(
                color: Color(0xFF919191),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,

              ),
            ),
            SizedBox(height: 14.h,),
            const Text(
              'Gender',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,

              ),
            ),

          ],
        ),
      ),
    );
  }
}
