import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walczak/common/constans/app_icons.dart';
import 'package:walczak/common/constans/app_images.dart';
import 'package:walczak/common/widgets/app_background.dart';
import 'package:walczak/common/widgets/app_footer.dart';
import 'package:walczak/screens/auth/state/auth_screen_state.dart';
import 'package:walczak/screens/auth/widget/auth_screen_check.dart';

class AuthScreenView extends StatelessWidget {
  final AuthScreenState state;

  const AuthScreenView({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: appBackground(),
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 44),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: _buildBoxDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCheckboxWithText(),
                    Image.asset(
                      AppImages.recaptcha,
                      height: 65,
                    ),
                  ],
                ),
              ),
            ),
            const AppFooter(),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(3.5),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 5,
          offset: const Offset(3, 3),
        ),
      ],
    );
  }

  Widget _buildCheckboxWithText() {
    const text = 'I\'m the WALCZAK';
    return InkWell(
      onTap: () => state.onCheckboxPressed(),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 8),
            child: state.isCheckboxOn
                ? AuthScreenCheck(state: state)
                : Icon(
                    AppIcons.checkbox,
                    size: 36,
                    color: Colors.black.withOpacity(0.20),
                  ),
          ),
          Text(
            text,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
