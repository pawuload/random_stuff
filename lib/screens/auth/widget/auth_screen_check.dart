import 'package:flutter/material.dart';
import 'package:walczak/common/constans/app_icons.dart';
import 'package:walczak/screens/auth/state/auth_screen_state.dart';

class AuthScreenCheck extends StatelessWidget {
  final AuthScreenState state;

  const AuthScreenCheck({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: state.isLoading
          ? CircularProgressIndicator(
              color: Colors.blueAccent,
              backgroundColor: Colors.blueAccent.withOpacity(0.4),
              strokeWidth: 3.5,
            )
          : const Icon(
              AppIcons.checked,
              size: 36,
              color: Colors.green,
            ),
    );
  }
}
