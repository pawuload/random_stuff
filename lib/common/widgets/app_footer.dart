import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const poweredBy = 'powered by ';
    const utopia = 'utopia.';
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              poweredBy,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'Axiforma-ThinItalic',
              ),
            ),
            Text(
              utopia,
              style: GoogleFonts.ubuntu(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
