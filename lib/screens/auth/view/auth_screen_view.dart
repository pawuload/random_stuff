import 'package:flutter/material.dart';
import 'package:walczak/common/constans/app_color.dart';

class AuthScreenView extends StatelessWidget {
  const AuthScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColors.background,
          child: Center(
            child: Container(
              width: 100,
              height: 100,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
