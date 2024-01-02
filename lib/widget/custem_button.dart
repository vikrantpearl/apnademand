import 'package:flutter/material.dart';

import '../const/colors.dart';

class CustomButton extends StatelessWidget {
  // Variable
  double? height;
  double? width;
  String title;
  VoidCallback? onTap;
  bool loading;

  CustomButton({Key? key,this.height,this.width,required this.title,this.onTap,this.loading=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
          ),
          child: loading ? const Center(child: CircularProgressIndicator(color: Colors.white,)) :Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
