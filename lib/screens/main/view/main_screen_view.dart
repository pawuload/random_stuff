import 'package:flutter/material.dart';
import 'package:walczak/common/widgets/app_background.dart';
import 'package:walczak/screens/main/state/main_screen_state.dart';

class MainScreenView extends StatelessWidget {
  final MainScreenState state;

  const MainScreenView({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //TODO add video from assets
        width: double.infinity,
        height: double.infinity,
        decoration: appBackground(),
        child: Center(child: Text('ej ty nicponiu')),
      ),
    );
  }
}
