import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widget/custem_button.dart';
import '../login_sinup/login_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PageView(
          children: [
            OnBoardingWidget(),
            OnBoardingWidgeta(),
            OnBoardingWidgetb(context)
          ],
        ),
      ),
    );
  }

  Widget OnBoardingWidget() {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/svg/onBoarding.svg"),
          Text(
            "Enjoy sharing benefits on UNIQLO APP",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "Special Price for App members, Exclusive designs & sizes only available online",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          SizedBox(
              height: 33.h,
              child: CustomButton(
                title: 'Continue',
              ))
        ],
      ),
    );
  }

  Widget OnBoardingWidgeta() {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/svg/ecommerce-checkout.svg"),
          Text(
            "Check out more interesting products early ",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "check product previews, styling recommendations, and in-store availability",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          SizedBox(
              height: 33.h,
              child: CustomButton(
                title: 'Continue',
              ))
        ],
      ),
    );
  }

  Widget OnBoardingWidgetb(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/svg/online-payment.svg"),
          Text(
            "stay up to date with the latest special offers",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "get notifications for new products, promotions, restock of favorite items, and limited offers",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          SizedBox(
              height: 33.h,
              child: CustomButton(
                title: 'Continue',
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
              ))
        ],
      ),
    );
  }
}
